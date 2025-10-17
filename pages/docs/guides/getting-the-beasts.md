# Beasts

To get or use beasts (Gang Beasts Characters, AI or Players) you need to use `Actor.cachedActors`.

## Get the Beasts Example
``` csharp
using MelonLoader;
using UnityEngine;
using Il2CppFemur;

public class GetBeasts : MonoBehaviour
{
    void Start()
    {
        foreach (Actor beast in Actor.cachedActors)
        {
            MelonLogger.Msg("Found beast:" + beast.gameObject.name)
        }       
    }
}
```
Or if you want to get only the AIs or only the Players then you should check if the Actor component (the component for the Gang Beasts Characters) you write `if (beast.ControlledBy == ControlledTypes.Human)` to get the players or write `if (beast.IsAI)` to get the AIs

## Get the AIs
``` csharp
foreach (Actor beast in Actor.cachedActors)
{
    if (beast.IsAI)
    {
        MelonLogger.Msg("Found beast:" + beast.gameObject.name)
    }
}
```
## Get the Players
``` csharp
foreach (Actor beast in Actor.cachedActors)
{
    if (beast.ControlledBy == ControlledTypes.Human)
    {
        MelonLogger.Msg("Found beast:" + beast.gameObject.name)
    }
}
```

# Other Creatures (Like Sharks and Birds)
If you want to get the Sharks or the Birds, for the Sharks you do 
``` csharp
SharkActor[] sharks = GameObject.FindObjectsOfType<SharkActor>(true);
```

For the Birds you do 
``` csharp
BirdActor[] birds = GameObject.FindObjectsOfType<BirdActor>(true);
```

Doc written by `konradKG25`