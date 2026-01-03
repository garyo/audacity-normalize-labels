#!/bin/bash

# Install Audacity Normalize Each Label plugins

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Detect OS and set plugin directory
if [[ "$OSTYPE" == "darwin"* ]]; then
    PLUGIN_DIR="$HOME/Library/Application Support/audacity/Plug-Ins"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    PLUGIN_DIR="$HOME/.audacity-data/Plug-Ins"
else
    echo "Unsupported OS: $OSTYPE"
    exit 1
fi

# Create plugin directory if it doesn't exist
mkdir -p "$PLUGIN_DIR"

# Copy plugin
cp "$SCRIPT_DIR/normalize-each-label.ny" "$PLUGIN_DIR/"

echo "Plugin installed to: $PLUGIN_DIR"
echo ""
echo "Next steps:"
echo "  1. Restart Audacity"
echo "  2. Go to Tools > Plugin Manager"
echo "  3. Enable 'Normalize Each Label'"
echo "  4. The plugin will appear under Tools > Normalize Each Label"
