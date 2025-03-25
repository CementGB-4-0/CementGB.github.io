# Saves the script's current path
$scriptPath = Split-Path -Parent $PSCommandPath

# Install and fix PATH for tools
dotnet tool update -g docfx
$env:PATH = "$HOME/.dotnet/tools;" + $env:PATH

# Build docs
docfx "$scriptPath/../pages/docs/docfx.json"

# Pack everything together nicely for deployment
& "$scriptPath/pack.ps1"
