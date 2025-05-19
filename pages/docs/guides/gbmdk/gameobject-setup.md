## Setting up GameObjects
In order for objects to function in Gang Beasts, they need certain components and settings applied to them, depending on whether they move around (dynamic) or if they cannot be moved around (static).

Eventually, there will be tools for creating and setting these components automatically.

## Both Dynamic and Static GameObjects

Some scripts are the exact same across any object. They are configured as follows:

### Interactable Object

- Game Object: [Root GameObject]
- Main Collider [Collider child of root GameObject]
- Priority Modifier: Low [In most use cases]
- Grab Modifier: Drain Slow
  > Higher values, such as Drain Medium and Drain Fast, will result in shorter amounts of time a beast can hold onto it.
- Damage Modifier: Default
  > Changing this to a value such as "Headbutt" will damage a beast as much as a headbutt would when a beast collides hard enough with that GameObject.
- Cached Transform: [Root GameObject]
- Cached Rigidbody [Rigidbody attached to root GameObject]
- Cached Colliders: [Colliders child of root GameObject]
- Check Velocity: Enabled

## Dynamic GameObjects
> [!IMPORTANT]
> Settings not listed should be left as default unless you know what you're doing.

- Non-component settings:
  - Tag: Prop (Low Priority) [in most use cases]
  - Layer: Default/Environment
  - Static: Disabled
  
### Rigidbody
- Mass: [any]
  >  Lower values will result in lighter objects. It's best to test out a good mass for your object using Unity Explorer in Gang Beasts itself. Example: The boxes that spawn in Incinerator have a mass of 60. Heavier objects, such as the benches in Aquarium, should have a mass between 120-220.
- Drag: [0-1]
   > Leaving this at its default will work fine. I don't notice that much of a change. But it's probably best not to go above 1. Example: The boxes that spawn in Incinerator have a drag value of 1.
- Angular Drag: 0.05
   > Again, leaving this at its default will work fine. I don't see any scenario where it would need to be changed.
- Use Gravity: **Enabled**
- Is Kinematic: **Disabled**
  > Having this enabled will make the GameObject unable to move. More info [here](<https://docs.unity3d.com/ScriptReference/Rigidbody-isKinematic.html>), in the Unity docs.
- Interpolate: **Interpolate**
  > This will prevent some jitter and instability that comes with no interpolation. The reason this must be enabled might have something to do with the game's networking. More info [here](https://docs.unity3d.com/6000.1/Documentation/ScriptReference/Rigidbody-interpolation.html), in the Unity docs.
- Collision Detection: **Discrete [or] Continuous**

## Static GameObjects
- Non-component settings:
  - Tag: **Untagged**
  - Layer: **Environment**
  - Static: **Enabled**

### Rigidbody
- Use Gravity: **Enabled**
- Is Kinematic: **Enabled**
    > Having this enabled will make the GameObject unable to move. More info [here](https://docs.unity3d.com/ScriptReference/Rigidbody-isKinematic.html), in the Unity docs.
- Interpolate: **Interpolate**
    > This will prevent some jitter and instability that comes with no interpolation. The reason this must be enabled might have something to do with the game's networking. More info [here](https://docs.unity3d.com/6000.1/Documentation/ScriptReference/Rigidbody-interpolation.html), in the Unity docs.
- Collision Detection: **Discrete [or] Continuous**
    > Stuck on figuring out which one to use? [Here](https://docs.unity3d.com/6000.1/Documentation/Manual/choose-collision-detection-mode.html)'s how the Unity docs help you decide.