# Documentation
Guides on how to create custom maps in Gang Beasts using GMBDK.

# Scene Setup

The easiest way to setup your scene is by right clicking, and going to GMBDK > Starters > Map Starters.
This will setup all the basic things you need to get started with making maps.

To rename your map, simply do what this GIF shows to do.

![rename-map-example]

Optional, but recommended, you can also rename these to the same things you put above.

![rename-scene-example]

It will prompt you to reload the scene. It is safe to ignore, but if you choose to reload, make sure you save beforehand.

Now, one more step.

![rename-exported-folder-example]
> NOTE: This will usually revert back to "ModName" if the project is closed then reopened. Simply do this again when you reopen it and you will be good.

You have now successfully renamed your map.

## How do I allow my map to be in different gamemodes?
- Click on the "[YourSceneName]-Info" asset, and set the Allowed Gamemodes. Right away you'll notice that there are a lot of gamemodes that aren't seen in Gang Beasts. Those are unused/WIP gamemodes that are still in the games code. They are unstable and do not work. Do not touch those.
  - It is also worth noting that the only supported gamemodes are Melee and Gang. All others are unsupported currently.

## How can I add music to my map?
1. Right click in the Project window and go to Create > Gang Beasts > Data > Scene Audio Config

2. Where it says "None (Audio Mixer)" click on the little double circle next to it and select the "Mixer".

3. Open up the "Music Data" dropdown and set the max volume to 1.

4. Next to the A side where it says "None (Audio Clip)" click the little double circle next to it and select your audio file.

5.  Click on the "Mixer", it will then redirect you to it's location. 

6.  Double click on the mixer

7. Delete the Bside, Drums, and Ambiance Snapshots.

8.  Click on the Aside snapshot, then the Aside Audio Mixer Group Controller, and set it's volume to "-35.00 dB"

9. Repeat step 8 for the Warp, Pause, Ambience, Interface, and SFX Audio Mixer Group Controllers.

>Here is a GIF showing steps 7, 8, and 9 for those who need it.

![adjust-mixer-settings]
> Note: Bside and Drums do not function properly currently. It is best to only use 1 side of music.


# Setting up GameObjects
In order for GameObjects to function in Gang Beasts, they need certain components and settings applied to them.
There are 2 main types of GameObjects in Gang Beasts: Dynamic, and static objects.
- What are they?
  - Dynamic GameObjects are objects that can be moved around.
  - Static GameObjects are objects that are unable to be moved around.
### Here is what you need to do to set things up:


> Note: Settings not listed should be left disabled unless you know what you're doing.
# Dynamic GameObjects:
- Non-component settings:
  - Tag: Prop (Low Priority) [in most use cases]
  - Layer: Default
  - Static: Disabled
## Rigidbody
- Mass: [any]
  >  Lower values will result in lighter objects. It's best to test out a good mass for your object using Unity Explorer in Gang Beasts itself. Example: The boxes that spawn in Incinerator have a mass of 60. Heavier objects, such as the benches in Aquarium, should have a mass between 120-220.
- Drag: [0-1]
   > Leaving this at it's default will work fine. I don't notice that much of a change. But it's probably best not to go above 1. Example: The boxes that spawn in Incinerator have a drag value of 1.
- Angular Drag: 0.05
   > Again, leaving this at it's default will work fine. I don't see any scenario where it would need to be changed.
- Use Gravity: **Enabled**
- Is Kinematic: **Disabled**
  > Having this enabled will make the GameObject unable to move. More info [here](<https://docs.unity3d.com/ScriptReference/Rigidbody-isKinematic.html>).
- Interpolate: **Interpolate**
- Collision Detection: **Discrete [or] Continuous**

## Interactable Object:
> Note: The Interactable Object script should be on each individual grabbable/non-grabbable object. This is planned to be set automatically by a tool in the future.
- Game Object: [root GameObject]
- Main Collider [collider parented to root GameObject]
- Priority Modifier: Low [in most use cases]
- Grab Modifier: Drain Slow
  > Higher values, such as Drain Medium and Drain Fast, will result in shorter amounts of time a beast can hold onto it.
- Damage Modifier: Default
  > Changing this to a value such as "Headbutt" will damage a beast as much as a headbutt would when a beast collides hard enough with that GameObject.
- Cached Transform: [root GameObject]
- Cached Rigidbody [rigidbody attached to root GameObject]
- Cached Colliders:
   - [colliders parented to root GameObject]
- Check Velocity: Enabled

---

# Static GameObjects:
- Non-component settings:
  - Tag: Untagged
  - Layer: Environment
  - Static: Enabled
## Rigidbody
- Mass: [any, changing will do nothing]
- Drag: [any, changing will do nothing]
- Angular Drag: [any, changing will do nothing]
- Use Gravity: **Enabled**
- Is Kinematic: **Enabled**
  > Having this enabled will make the GameObject unable to move. More info [here]
- Interpolate: **Interpolate**
- Collision Detection: **Discrete [or] Continuous**

## Interactable Object:
> Note: The Interactable Object script should be on each individual grabbable/non-grabbable object. This is planned to be set automatically by a tool in the future.
- Game Object: [root GameObject]
- Main Collider [collider parented to root GameObject]
- Priority Modifier: Low [in most use cases]
- Grab Modifier: Drain Slow
  > Higher values, such as Drain Medium and Drain Fast, will result in shorter amounts of time a beast can hold onto it.
- Damage Modifier: Default
    > Changing this to a value such as "Headbutt" will damage a beast as much as a headbutt would when a beast collides hard enough with that GameObject.
- Cached Transform: [root GameObject]
- Cached Rigidbody [rigidbody attached to root GameObject]
- Cached Colliders:
   - [colliders parented to root GameObject]

---

# NavMesh Baking
## What is a NavMesh?
NavMeshes are spots of a map where AIs know where to walk.

If a map does not have a NavMesh, AIs will continuously walk straight forward. NavMeshes can only be on maps that are entirely static, such as Roof, Incinerator, and others. Whereas maps like Trawler, Wheel, and others, do not and cannot have NavMeshes, because they are dynamic non-static maps.

## How do I bake a NavMesh?
1. Make sure all GameObjects you want AIs to be able to walk on have the "Static" checkbox checked.
2. Go to: Window > AI > Navigation. It will then bring you to a Navigation tab next to the inspector.
3. Go to the "Bake" part of the tab.
4. Click "Bake".
5. Done! There should now be a blue highlight on the static GameObjects. That is the NavMesh itself.

### Troubleshooting
- I don't see any blue highlights on my map! Where is it?
  - Either you don't have the "Show NavMesh" checkbox checked at the corner of the Scene View, or the "Static" checkbox is unchecked on the GameObjects you want the NavMesh to be.
- If the NavMesh is not reaching places of your map you want it to, you can try lowering the "Agent Radius" in the Bake part of the Navigation tab. Don't put it too low though. The default value should be good in most situations, but if not, you shouldn't go lower than 0.2.