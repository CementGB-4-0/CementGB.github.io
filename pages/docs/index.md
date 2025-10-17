---
_layout: landing
---

# Cement Documentation

Welcome to the Cement docs. Here you will find detailed guides and references for the MelonLoader-based Gang Beasts modding library Cement 4.0 and learned information on modding in the Gang Beasts development environment.

You can download the CementGB modding library [here](../).

## Installation

1. Install the latest release of [MelonLoader](https://github.com/LavaGang/MelonLoader/releases/latest/) from the installer or, if you're installing on Gang Beasts for the Microsoft Store, the zipped file located on their GitHub Releases page. (If you already have it, make sure it's up to date)  
Further installation instructions for MelonLoader can be found on [their wiki](https://melonwiki.xyz/#/).
2. Run the game after installing MelonLoader to make sure it generates all the necessary files.
3. Download `CementGB.dll` from our GitHub Releases page, linked on the [landing page](../) in the `Download` button.
4. Drag `CementGB.dll` from your `Downloads` folder into the newly created `Mods` folder in your game folder, typically located at `C:/Program Files (x86)/Steam/steamapps/common/Gang Beasts` if you own the game on Steam and are installing on Windows. (*If you own the game on Microsoft Store, your game folder is somewhere in `C:/Program Files/WindowsApps`*). you may need to tweak this folder's permissions to allow copying stuff to it.
5. All done! Run the game and check for any issues.

## Directory

- Runtime
  - [Introduction to IL2CPP](guides/introduction-to-il2cpp.md)
  - Gang Beasts
    - [Getting the Beasts](guides/getting-the-beasts.md)
    - [Spawning the Beasts](guides/spawning-beasts.md)
    - [The Actor Component](guides/the-actor-component.md)
    - Multiplayer
      - [Sending Multiplayer Messages](guides/sending-messages.md)
    - CementGB
      - [CementGB Launch Arguments](guides/cementgb-args.md)
      - [Loading Asset Bundles](guides/loading-assetbundles.md)
- [GBMDK / Unity Editor](guides/gbmdk/gbmdk-index.md)
- [Credits](guides/credits.md)
