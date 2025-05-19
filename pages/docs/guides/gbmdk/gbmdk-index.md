# GBMDK

GBMDK is a Unity package that provides tools for aiding in editor-side asset mod development. Its not a fully no-code solution for modding in its current state, however it is possible to make basic maps with it without any custom user-written code.

## Installation & Initial Setup

### Prerequisites

- A **legal** copy of [Gang Beasts](https://gangbeasts.game/), and access to the folder the game is located in (see [main index](../../index.md) for more info)
- [MelonLoader](https://melonwiki.xyz/#/), installed on your copy of Gang Beasts (see [main index](../../index.md) for more info)
- [CementGB](https://thunderstore.io/c/gang-beasts/p/CementGB/CementGB/), installed on your copy of Gang Beasts (see [main index](../../index.md) for more info)
- [Unity Hub](https://unity.com/download)
- [Unity Editor v2021.3.33f1](unityhub://2021.3.33f1/ee5a2aa03ab2) (Windows IL2CPP build support enabled)
- [Git](https://git-scm.com/)

### Step-by-step

- Create a new 3D Unity project from Unity Hub. Ensure you are on the version of Unity the game is on (2021.3.33f1).
- Once the editor boots, install the GBMDK package using the following git url with [this tutorial from the Unity docs](https://docs.unity3d.com/6000.1/Documentation/Manual/upm-ui-giturl.html): `https://github.com/CementGB-4-0/GBMDK.git#feature/package-restructure`
- Wait for the editor to do its thing. If it prompts you to reboot, do so. If it says something like "Destructive Action Warning. . . First Run Detected", press OK.
- When the installation completes, you should have an AddressableAssetsData folder in your Project window. If it is not there or the AddressableAssetSettings object within it is empty or bugged, go to `GBMDK` at the top, then click through to `Testing > Set First Run`. Repeat this action if anything with Addressables seems misconfigured and if the issue persists, submit a [bug report](https://github.com/CementGB-4-0/GBMDK/issues) with as much information as you know.

