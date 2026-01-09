# CementGB Launch Arguments

There are launch arguments in CementGB, most are dev argumetns and most are user-friendly. Here are all the args that are in the current version of CementGB

## -map Argument
This argument lets you launch a map on start of Gang Beasts. This works for default maps and modded maps that you have installed on your Gang Beasts.

For example, Subway:
```
"Gang Beasts.exe" -map Subway
```

This is very usefull for quick tests on Modded Gang Beasts servers for specific maps.

## -mode Argument
This argument lets you launch a map on start of Gang Beasts. This works alongside the `-map` argument.

For example, Waves:
```
"Gang Beasts.exe" -map Subway -mode Waves
```

## -debug Argument
Pretty Self Explanatory.

## -ip and -port Argument
These 2 arguments must be paired together to run. These arguments, when writen with correct ip for `-ip` and port for `-port`, this activates the `DevelopmentTestServerGUI`. This allows for quick connecting with modded servers, but mostly used for testing purposes. There are some vales that are not shown by default, such as `Players` wich lets you set how many players from your side you want to connect to the server. For local server testing, use ip `127.0.0.1`. The default port for all servers for connecting and hosting is `6000`.

## -SERVER Argument
This argument, turns your launched Gang Beasts instance into a Modded Server Instance. This does not oveerride your client, as most code used to make this modded server work was already in gang beast's code. So you can run your server and your client at the same time without steam interupting any of the instances of the game.

## -lowgraphics Argument
This argument launches your game with the lowest graphics preset in the game without messing around with your normal graphics settings, so when you launch your normal game after using `-lowgraphics`, it will be back as normal. This is used for modded servers, so you can enjoy playing Modded Gang Beasts with your friends with smooth fps, while running the server! :)

## -pfwd Argument
This argument is auto Port Forwarding. When you run a server with this argument, it will auto port forward the server so everyone of your friends can join it, instead of manualy port forwarding before letting people in. This only works for [NAT](https://www.google.com/search?q=NAT+routers+meaning) or [UPnP-enabled](https://www.google.com/search?q=UPnP-enabled+routers+meaning) routers.

Doc written by `konradKG25`