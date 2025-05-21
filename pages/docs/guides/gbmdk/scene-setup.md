# Map Setup

The easiest way to set up your scene is by right clicking, and going to `GMBDK > Starters > Map Starter`.
This will set up all the basic things you need to get started with making maps.

## Renaming the Map Starter assets

> [!WARNING]
> You should save often already, but in case you don't particularly pay attention to how often you save, make sure to save your project (`Ctrl + s`) before you make any of the following modifications.

To rename your map, simply rename the assets and Addressable keys belonging to it. Start with the Addressable key, found next to the Addressable checkbox in the assets' Inspector windows. Make sure to keep the hyphens (`-`) and whatever comes after them, and to use `PascalCase` for the names of maps, as shown below:

![rename-map-example](../../images/rename-map-example.gif)

Ensure your asset names are the same as the ones you put next to the Addressable label, as shown below:

![rename-scene-example](../../images/rename-scene-example.gif)

It may prompt you to reload the scene. Please do so.

Now, one more step. Set the `ModName` variable in `Asset Management > Addressables > Profiles` to the name of the mod the map you are making is a part of. This name can be the same as the map's name.

![rename-exported-folder-example](../../images/rename-exported-folder-example.gif)
> [!NOTE] 
> This will sometimes revert back to `NewMod` or `ModName` if the project is closed then reopened. Simply do this again when you reopen it and you will be good.

You have now successfully renamed your map.