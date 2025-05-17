# Saves the script's current path
$scriptPath = Split-Path -Parent $PSCommandPath

& "$scriptPath/build.ps1"
python3 -m http.server 8080