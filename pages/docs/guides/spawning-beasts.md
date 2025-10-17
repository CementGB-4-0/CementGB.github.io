# Spawning Beasts

Getting and spawning the beasts is really simple actually! There are 3 steps to spawning a working beast, Getting the Beast Data, Spawning in the beast and Configuring Settings. This method works for all beasts, Big, Medium and Small.

## Getting the Beast Data
To get the data for each beast, we use the `CostumePool` class, as this includes the `GetData<T>` function in `CostumePool.I.BeastResources`

```csharp
//Get the Medium Beast Data
CostumePool.I.BeastResources.GetData<GameObject>("Medium");

// Get the Big Beast Data
CostumePool.I.BeastResources.GetData<GameObject>("Big");

// Get the Small Beast Data
CostumePool.I.BeastResources.GetData<GameObject>("Small");
```

## Spawning in the beast
Now that we got our data, we can use the `Instantiate` function in `GameObject` class to spawn the beast in. For this example, we will be spawning the Medium beast.

```csharp
GameObject beast = GameObject.Instantiate(CostumePool.I.BeastResources.GetData<GameObject>("Medium"), new Vector3(0, 0, 0), Quaternion.identity);
```

### Note: That all beasts spawn with their origin being the bottom of the beast so make sure you spawn it on the ground and not in the air! LOL

## Configuring Settings

Now that you got a beast spawned, use

```csharp
Actor actor = beast.GetComponent<Actor>();
```

Now that we have the actor (the core Beast Component), you can edit the settings however you want. If you want to make it work with AI, you do

```csharp
actor.ControlledBy = Actor.ControlledTypes.AI;
```

Doc written by `konradKG25`