# Loading Asset Bundles
### Note: CementGB is required for Loading Asset Bundles.

## Importing into your mod
Once you have your asset bundle, ![Example Asset Bundle](../images/examplebundle.png)
Make a folder named `assets` in your mod's code folder and Drag & Drop your asset bundle into your `assets` folder. Then, go into your `modname.csproj`, inside your `<Project>` and `</Project>`, add this

```
<ItemGroup>
  <EmbeddedResource Include="assets\yourbundlename" />
</ItemGroup>
```
Though if you compiled your asset bundle with a file extension, you'll have to write your bundle name and your file extension, for me, it's `assets.bundle`

Now once you done the steps above, the mod now should be compiling with the asset bundle.

## Loading the Asset Bundle
Now that your asset bundle is in your mod, lets load it into the game.

```csharp
AssetBundle AssetBundle = EmbeddedUtilities.LoadEmbeddedAssetBundle(System.Reflection.Assembly.GetExecutingAssembly(), "yourprojectname.assets.yourbundlename");
```
Add the line to `OnLateInitializeMelon()`. It would look like this
```csharp
public override void OnLateInitializeMelon()
{
    AssetBundle AssetBundle = EmbeddedUtilities.LoadEmbeddedAssetBundle(System.Reflection.Assembly.GetExecutingAssembly(), "yourprojectname.assets.yourbundlename");
}
```

If you have a file extension with the bundle, then write instead 

```csharp
public override void OnLateInitializeMelon()
{
    AssetBundle AssetBundle = EmbeddedUtilities.LoadEmbeddedAssetBundle(System.Reflection.Assembly.GetExecutingAssembly(), "yourprojectname.assets.yourbundlename.yourfileextension");
}
```

If you see this
```
[07:17:42.571] [CementGB] Loading stream for resource 'yourprojectname.assets.yourbundle' embedded from assembly...
[07:17:42.575] [CementGB] Done!
[07:17:42.577] [CementGB] Loading assetBundle from data 'yourprojectname.assets.yourbundle', please be patient...
[07:17:42.727] [CementGB] Done!
```
It means that it has loaded correctly!

## Loading Assets from Asset Bundle
Now that it's loaded and working, we can now start loading assets from the asset bundle

For this example, I will be loading a Shark, the one from Trawler.

```csharp
sharkPrefab = AssetUtilities.LoadPersistentAsset<GameObject>(AssetBundle, "SharkPrefab");
```

Make sure to make a empty variable with the type of the thing you are trying to load at the top of the class, so you can quickly access it instead of having to keep on loading. This paired with the `OnLateInitializeMelon()` and the variable would be
```csharp
public GameObject sharkPrefab;

public override void OnLateInitializeMelon()
{
    AssetBundle AssetBundle = EmbeddedUtilities.LoadEmbeddedAssetBundle(System.Reflection.Assembly.GetExecutingAssembly(), "yourprojectname.assets.yourbundlename.yourfileextension");
    sharkPrefab = AssetUtilities.LoadPersistentAsset<GameObject>(AssetBundle, "SharkPrefab");
}
```

Now you can spawn it anywhere with the [Instantiate](https://docs.unity3d.com/2021.3/Documentation/ScriptReference/Object.Instantiate.html) from the [GameObject](https://docs.unity3d.com/2021.3/Documentation/ScriptReference/GameObject.html) class.

Doc written by `konradKG25`