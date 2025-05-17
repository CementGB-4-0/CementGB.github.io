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