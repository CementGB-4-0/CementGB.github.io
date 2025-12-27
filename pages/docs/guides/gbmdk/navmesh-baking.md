# NavMesh Baking
---
## What is a NavMesh?

NavMeshes are static spots of a map where AIs know it is safe to walk.

If a map does not have a NavMesh, AIs will continuously walk straight forward, not move at all, or jump frantically. NavMeshes can only be on maps that are entirely static, such as Roof, Incinerator, and others. Whereas maps like Trawler, Wheel, and others, do not and cannot have NavMeshes, because they are dynamic non-static maps.

---
## How do I bake a NavMesh?

1. Make sure all GameObjects you want AIs to be able to walk on have the "Static" checkbox checked.
2. Go to `Window > AI > Navigation`. It will then bring you to a Navigation tab next to the inspector.
3. Go to the "Bake" section of the tab.
4. Click "Bake".
5. Done! There should now be a blue highlight on the static GameObjects. That is the NavMesh itself.
---
### Troubleshooting

- I don't see any blue highlights on my map! Where is it?
  - Either you don't have the "Show NavMesh" checkbox checked at the corner of the Scene View, or the "Static" checkbox is unchecked on the GameObjects you want the NavMesh to be.
- The NavMesh is not reaching places of the map I want it to! 
    - You can try lowering the "Agent Radius" in the Bake section of the Navigation tab. Don't put it too low though. The default value should be good in most situations, but if not, you shouldn't go lower than 0.2.