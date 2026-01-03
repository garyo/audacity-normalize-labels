# Install Audacity Normalize Each Label plugins for Windows

$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$PluginDir = "$env:APPDATA\audacity\Plug-Ins"

# Create plugin directory if it doesn't exist
if (-not (Test-Path $PluginDir)) {
    New-Item -ItemType Directory -Path $PluginDir -Force | Out-Null
}

# Copy plugin
Copy-Item "$ScriptDir\normalize-each-label.ny" -Destination $PluginDir -Force

Write-Host "Plugin installed to: $PluginDir"
Write-Host ""
Write-Host "Next steps:"
Write-Host "  1. Restart Audacity"
Write-Host "  2. Go to Tools > Plugin Manager"
Write-Host "  3. Enable 'Normalize Each Label'"
Write-Host "  4. The plugin will appear under Tools > Normalize Each Label"
