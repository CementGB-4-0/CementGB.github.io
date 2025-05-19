# Scene Setup

The easiest way to setup your scene is by right clicking, and going to `GMBDK > Starters > Map Starter`.
This will setup all the basic things you need to get started with making maps.

To rename your map, simply set the text next to the Addressable label in the assets' Inspector windows. Make sure to keep the hyphens (`-`) and whatever comes after them, and to use `PascalCase` for the names of maps, as shown below:

![rename-map-example](../../images/rename-map-example.gif)

Ensure your asset names are the same as the ones you put next to the Addressable label, as shown below:

![rename-scene-example](../../images/rename-scene-example.gif)

It will prompt you to reload the scene. It is safe to ignore, but if you choose to reload, make sure you save beforehand.

Now, one more step. Set the `ModName` variable in `Asset Management > Addressables > Profiles` to the name of the mod the maps are a part of.

![rename-exported-folder-example](../../images/rename-exported-folder-example.gif)
> [!NOTE] 
> This will sometimes revert back to `NewMod` or `ModName` if the project is closed then reopened. Simply do this again when you reopen it and you will be good.

You have now successfully renamed your map.