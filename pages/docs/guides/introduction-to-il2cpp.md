# Introduction to IL2CPP

> [!WARNING]
> This section explains in detail some *intermediate*
 concepts a beginner may not fully understand or require. To jump straight into making a simple map for Gang Beasts, go to the [GBMDK docs](gbmdk/gbmdk-index.md).

Before Gang Beasts v1.22, we used to be able to do a lot more with modding, such as full Harmony support (explained later on), out-of-the-box importing of more Unity packages, accurate source decompilation of code using DnSpy, etc... 

This is because the game used to use Unity's Mono backend for code compilation. This backend would compile C# code to lower level instruction code known as CIL, or simply IL, which stands for Common Intermediate Language or just Intermediate Language. These instructions were changeable at runtime, which made modding a breeze using patching tools like MonoMod and Harmony (packaged with BepInEx), and decompilation was even easier.  

Unfortunately, once Gang Beasts began receiving updates again in 2023, Boneloaf (the developers of Gang Beasts) switched the game over to Unity's IL2CPP backend for performance and compatibility reasons. This adds an extra step to compilation, converting the IL to even lower level C++ code (which then compiles to machine code), making the code potentially faster but also much harder to decompile and modify.

Thanks to MelonLoader and its libraries, however, its still possible to modify the game almost the same way we could before, just with a few janky bits.

> [!TIP]
> Further reading about modding with C# in a Unity IL2CPP domain is covered on the [MelonLoader wiki](https://melonwiki.xyz) and [Il2CppInterop docs](https://github.com/BepInEx/Il2CppInterop/tree/master/Documentation). It can also be helpful to ask questions in community chats such as our [Cement](https://discord.gg/fCwXc5k43w) Discord, the [MelonLoader](https://discord.gg/2Wn3N2P) Discord, or the [BepInEx](https://discord.gg/MpFEDAg) Discord.

## Notable IL2CPP Differences

### Registering Objects Native-Side

TL;DR: Use the `RegisterTypeInIl2Cpp` attribute MelonLoader provides if your class inherits from `UnityEngine.Object`.

### Native vs Managed Types

> [!TODO]
> Explain difference between Il2CppSystem.Type and System.Type (https://melonwiki.xyz/#/modders/il2cppdifferences). . .

### Harmony

> [!IMPORTANT]
> Harmony is explained in full in [the Harmony docs](https://harmony.pardeike.net/). 
> For ease of explanation, we highly recommend you read these docs for more information. 

When you work with Harmony in IL2CPP, you're not able to manipulate the runtime code (IL) of the game like in Mono. Instead, you're basically hooking into codeless generated "dummy" assemblies that only contain the method signature for the original native method.  

What this means is *Harmony's "transpilers" are no longer possible entirely*, as there isn't any actual instructions to patch. You can only patch a method using a prefix or a postfix that runs before or after the method being patched, respectively. 

The recommended way of creating a Harmony patch for a Cement mod is as follows (there are many ways one can be written, this is up to personal convention):

```csharp
using System;
using HarmonyLib;
using MelonLoader;

namespace MyFirstMod;

internal static class VanillaTypePatches // It is recommended to follow these naming conventions (PascalCase + Vanilla type name + "Patches" at the end)
{
    [HarmonyPatch(typeof(VanillaType), nameof(VanillaType.VanillaMethod))] // Replace VanillaType and VanillaMethod with the type and method you want to patch
    private static class VanillaMethodPatch // This is a class because you can put both a prefix and a postfix on the same method (also recommended to follow the same naming conventions, this time with vanilla method name and non-plural "Patch")
    {
        /* Called just before VanillaMethod. Returns a bool to decide whether to run the original method or not: false = skip original method, true = don't skip. Can also be void if you want it to always run the original method.
        Try to prefer using Postfix as this can prevent other patches from running. MUST BE CALLED "Prefix" OR HAVE THE [HarmonyPrefix] ANNOTATION! */
        private static bool Prefix()
        {
            // Can be anything

            return true;
        }

        private static void Postfix() // Called after VanillaMethod. Recommended for most patching cases to ensure mod compatibility. MUST BE CALLED "Postfix" OR HAVE THE [HarmonyPostfix] ANNOTATION!
        {
            // Can be anything
        
            Melon<Core>.Logger.Msg(ConsoleColor.Green, "Patch worked!"); // This code will be called after VanillaMethod is finished but before it returns a value, allowing you to modify said value if it exists (explained later). This exact line of code is not required for the patch to function, it is simply a log line to indicate that the patch worked.
        }
    }
}
```

> [!TODO]
> Provide IL2CPP-specific info about [Harmony injections](https://harmony.pardeike.net/articles/patching-injections.html)

> [!WARNING]
> IL2CPP Harmony patches do not work well for class constructors OR generic methods and types. Do not be fooled by the existence of `MethodType.Constructor`!

### Unity-Serialized Fields

> [!TIP]
> Some useful information about how this system works in Unity itself can be found in the [Unity docs](https://docs.unity.com/), starting from the [`SerializeField` attribute documentation](https://docs.unity3d.com/ScriptReference/SerializeField.html).

Explanations for this in modding are hard to come by, but we'll try our best to summarize. Basically, Unity's serialized `MonoBehaviour` fields (such as non-hidden public fields and private fields with the [`SerializeField`](https://docs.unity3d.com/ScriptReference/SerializeField.html) attribute) are saved as separate data associated with that script's `GameObject` GUID and `Assembly`. 

In Mono, it was possible, without any extra effort, to make custom scripts inside the Unity Editor with these serialized fields and later inject the object the script is attached to via [`AssetBundle`](https://docs.unity3d.com/ScriptReference/AssetBundle.html) into the game with all editor-assigned fields preserved. With IL2CPP this becomes slightly harder.

> [!NOTE]
> The following concepts are taken from [this Il2CppInterop pull request](https://github.com/BepInEx/Il2CppInterop/pull/24) and further explained.

If you know enough C# or OOP, you're probably at least vaguely aware of value and reference types. Value types are basically `primitive` types, such as `float` or `int`, or deriving from `struct`, and reference types are ones deriving from `object` (i.e. defined in a `class`). In order to properly inject `MonoBehaviour` fields into the game's domain, you must use one or the other.

The PR noted above shows an example for implementing these fields both in the editor environment before injection and in the game, which we'll call "native-side". Here are a couple things to notice:

- In the "Unity Editor Script" provided in the PR, the datatype assigned to the variable is simply `string`, `GameObject`, or `long`, and can be any *default* [serializable type](https://docs.unity3d.com/ScriptReference/SerializeField.html#:~:text=CANNOT%20serialize%20properties.-,Serializable%20types,-Unity%20can%20serialize). The type can also be of a class of basic inheritance.
- In the "Injection Script" provided in the PR, the datatype assigned to the variable is different. It is now a generic type wrapping the original type defined in the Editor Script.
- The Start method (and by extension *any* method defined in both scripts) and its working code only exists at runtime, in the Injection Script.
- The Start method in the Injection Script accesses the value of injected fields by calling the `.Get()` method on the `Il2Cpp*****Field`-type variable. *This is how you must access the values of all editor-assigned fields at runtime.*

### Applying Native Interfaces

> [!TODO]
> Explain interface conversion to classes and how to use `ClassInjector.RegisterTypeInIl2Cpp` to apply said interface-classes to registered custom native types.
