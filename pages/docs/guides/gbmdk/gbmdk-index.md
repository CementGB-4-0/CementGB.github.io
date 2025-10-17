# GBMDK

GBMDK is a pre-configured Unity project that provides tools for aiding in editor-side asset mod development. In combination with CementGB, it is capable of creating basic custom stages and assets with base game code attached and inspecting vanilla game assets with Asset Viewer and AssetRipper/AssetMigrator.

## Installation & Initial Setup

### Prerequisites

- A **legal** copy of [Gang Beasts](https://gangbeasts.game/), and access to the folder the game is located in (see [main index](../../index.md) for more info)
- [MelonLoader](https://melonwiki.xyz/#/), installed on your copy of Gang Beasts (see [main index](../../index.md) for more info)
- [CementGB](https://thunderstore.io/c/gang-beasts/p/CementGB/CementGB/), installed on your copy of Gang Beasts (see [main index](../../index.md) for more info)
- [Unity Hub](https://unity.com/download)
- [Unity Editor v2021.3.33f1](unityhub://2021.3.33f1/ee5a2aa03ab2) (Windows IL2CPP build support enabled)
- [Git](https://git-scm.com/)

### Step-by-step

> [!TODO]
> Add images/gifs demonstrating these instructions

1. **Clone the project** by clicking the big green `Code` button at the top of the [GitHub repository](https://github.com/CementGB-4-0/GBMDK). *If you're contributing to the main project, you must fork the repository* and use your Git client of choice to clone it (always go with [GitHub Desktop](https://github.com/apps/desktop) if you don't know what this means). If not, download the repository as a zip file and extract it to a folder of your choice. *If you aren't contributing to the main project, you are free to rename the project folder however you like.*
2. **Open the project in Unity Hub.**. Simply open Unity Hub, click `Add... > Project from disk...`, navigate to the project folder, and click the confirm button. *Wait for the project to load.* If a window comes up warning you of a destructive action or telling you to reload the project, press `OK` or reload the project like it tells you. 

### Extra Configuration

After a while of loading, you should be in the project's scene view. There are still a few things you may want to configure but aren't technically necessary:

#### GBMDK Config

**You can set the path to your modded Gang Beasts installation among other things in `GBMDK` *[Top Bar]* `> Open Config`.** This is required for any GBMDK feature that requires interaction with the actual game, like Asset Viewer or Mod Tester. You can also set the name of the mod you're currently iterating on here, in the `Active Mod Name` field. 

#### Addressables Settings

**It is typically advised not to touch these** unless you know what you're doing or are told to. They are located at `Assets/AddressableAssetsData` relative to the project folder. Put simply, they detail how to bundle your assets to be loaded at runtime through Cement. If your game displays an infinite loading screen without any errors logged to the console during runtime, chances are the Addressables settings are misconfigured.

### Updating

> [!TODO]
> Finish up updating code for new project template and write docs for them

### Where to go from here?

Get started with custom maps and the Map Starter in [Map Setup](./scene-setup.md).
