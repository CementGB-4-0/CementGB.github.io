# Sending Messages

Sending messages is important for us to be able to send data to a Modded Server and to other Clients connected to it in our Multiplayer Mod!

### Example Code for a Message Base Class
```csharp
using Il2CppInterop.Runtime.Injection;
using MelonLoader;
using System;
using UnityEngine.Networking;

[RegisterTypeInIl2Cpp]
internal class TestMsg : MessageBase
{
    // Ignore these weird things it's for compatibility
    public TestMsg(IntPtr ptr) : base(ptr) { }
    public TestMsg() : base(ClassInjector.DerivedConstructorPointer<TestMsg>()) { ClassInjector.DerivedConstructorBody(this); }

    public int sugar = 14;

    public override void Serialize(NetworkWriter writer)
    {
        // We're writing sugar's amount into the recipe
        writer.Write(sugar);
    }

    public override void Deserialize(NetworkReader reader)
    {
        // This is getting the amount of sugar we wrote into the recipe and putting it in our bowl
        sugar = reader.ReadInt32();
    }
}
```
Example Written by Ethan Barron

The example is like a recipe. You write all the ingredients you need in the `Serialize` method that the client sends and in `Deserialize` the server reads the ingredients from the recipe and puts it into their bowl. Basically, the client writes all info in `Serialize` and then gets sent to the server and read in `Deserialize`.

## Writing and Reading Data

For the client to write info that will get sent to server, you do
```csharp
int playerSize = Actor.CachedActors[1].transform.localScale.x; // the player's x size

public override void Serialize(NetworkWriter writer)
{
    writer.Write(playerSize); // for example, the int of the player's size
}
```
However, Variables can only be written if they are supported by the `NetworkWriter`.

For the server to read the info sent from the client, you do
```csharp
int playerSize = Actor.CachedActors[1].transform.localScale.x; // just a placeholder for the reader to know what variable they need to read from the client.

public override void Deserialize(NetworkReader reader)
{
    reader.ReadInt32(playerSize) // to read that variable info sent from client
}
```
You have now written a writer and a reader! Now in the `Deserialize`, you can write anything that will be ran at the server! For example, I will read the player's wanted punch force sent from the client, and I can modify the player's punch force to be the one they wanted.

Doc written by `konradKG25`