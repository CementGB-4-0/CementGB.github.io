# Saves the script's current path
$SCRIPTPATH = Split-Path -Parent $PSCommandPath

# Remove previous build
Remove-Item -Path "$SCRIPTPATH\..\build" -Recurse -Force -ErrorAction SilentlyContinue

# Pack pages into build
Copy-Item -Path "$SCRIPTPATH\..\pages\landing" -Destination "$SCRIPTPATH\..\build" -Recurse -Force
Copy-Item -Path "$SCRIPTPATH\..\pages\docs\_site" -Destination "$SCRIPTPATH\..\build\docs" -Recurse -Force

# Compress build to tar.gz (unused)
# Compress-Archive -Path "$SCRIPTPATH\..\build\*" -DestinationPath "build.tar.gz" -CompressionLevel Optimal
