# The Actor Component

Beasts have a component named `Actor` and there are lots of customizations for the `Actor` component.

`_punchForceModifer`

`_punchDamageModifer`

`gangID`

`ControlledBy`

`primaryColor`

`playerID`

`isLocalPlayer`

`RandomVoice`

## _punchForceModifier
`_punchForceModifier` is the value for the ammount of punch force the beast has. The default value is `1` for medium, `10` for big beast, you can edit the value to the ammout of punch force you want.

```csharp
_punchForceModifier = 1; // Default Value
_punchForceModifier = 20; // Example 20 Punch Force 
```

## _punchDamageModifier
`_punchDamageModifier` is the value for the ammount of punch damage that beast can do to other beasts. The default value is `1` for medium beast, `0.6` for big beast, you can edit the value to the ammount of pucnh damage you want. The higher the punch damage, the less punches you need to knockout the beast but also higher punch damage can also cause the knock out time of that knocked out beast. For example `20` punch damage, will knockout the beast with one punch and that beast will be knocked out longer.
```csharp
_punchDamageModifier = 1; // Default Value
_punchDamageModifier = 20; // Example 20 Punch Damage
```

## gangID
`gangID` is the value to determine what player or AI is on what gang. AIs also have gangID that can be changed and even used to make battles. gangID is also used to players when in the `Gang` Gamemode. There is even a way to make a AI friend! When the AI spawns turn the AI's gangID to your player's gangID and boom! You have a friend that fights others that are not friends but the friend doesn't fight you!
### AI Friend Example
```csharp
actor.gangID = player.gangID
```

## ControlledBy
`ControlledBy` is a property to determine if the beast is a

`AI`

`Human`

`Animation`

`AI` is the AI. If you were to for example turn your player into a AI it would be controlled by a AI, you can't even controll it.

`Human` is the player that you or a person is controlling.

`Animation` is the beasts that are controlled by nothing, just the game telling them what state to do. It is used in the selection part of the Main Menu.

## primaryColor

`primraryColor` is the color value for when beasts gen initalized. When you set a color on it before it initalizes, it will apply that color that you set on `primraryColor`. Use RGB 0-1 for the color so if you want to turn a RGB 0-255 color to 0-1 you have to divide the color by 255, so

```csharp
float newR = r / 255
float newG = g / 255
float newB = b / 255
```

And then to put it into the `primraryColor`, you do

```csharp
beast.primraryColor = new Color(newR, newG, newB);
```

## playerID

`playerID` is the ID for each player in the map that you're playing on. This does not include AI beasts. First player has the ID 0, the second player has 1 and so on. This can help you identifiy who was the first player.

## isLocalPlayer

`isLocalPlayer` is a boolean that can show if a player is one of your players. This is usefull for Online when modding to check wich players are your players from your side, the ones that you controll. This works for Online + Coach Co-op too!

## RandomVoice

`RandomVoice` is a boolean that determines if to use a random voice or a selected voice, the name is self explanatory. Gang Beasts' default costumes have `RandomVoice` on, meanwhile, your own costumes use your selected voice.

Doc written by `konradKG25`