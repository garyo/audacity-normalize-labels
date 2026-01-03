# Normalize Each Label - Audacity Plugin

An Audacity plugin that normalizes each labeled region independently with a single click. Perfect for processing live recordings where you've labeled individual songs and want consistent volume levels before exporting.

## The Problem

When I record a live music gig, I end up with a long 32-bit WAV file. My workflow is:

1. Import into Audacity
2. Label each song
3. Normalize each song's volume
4. Export as separate MP3s

Step 3 is tedious—I have to select each labeled region, run Effects > Volume and Compression > Amplify, repeat for every song. This plugin automates that entire step.

## Installation

1. Download `normalize-each-label.ny`
2. Copy it to your Audacity plugins folder:
   - **macOS**: `~/Library/Application Support/audacity/Plug-Ins/`
   - **Windows**: `%APPDATA%\audacity\Plug-Ins\`
   - **Linux**: `~/.audacity-data/Plug-Ins/`
3. Restart Audacity
4. The plugin appears under **Tools > Normalize Each Label**

## Usage

1. Import your audio file
2. Create a label track and label each region (song) you want to normalize
3. Select All (Cmd+A / Ctrl+A)
4. Run **Tools > Normalize Each Label**
5. Export your files

Each labeled region is normalized independently to -1 dB peak level, ensuring consistent volume across all regions with headroom for MP3 encoding.

## How It Works

The plugin:
- Reads all labels from your label track
- Iterates through each labeled region
- Applies Audacity's Normalize effect (-1 dB peak) to each region independently
- Reports how many regions were processed

This is equivalent to manually selecting each labeled region and running Normalize, but automated.

## Requirements

- Audacity 3.x (uses Nyquist plugin version 4)

## License

MIT License - see [LICENSE.md](LICENSE.md)

## Author

Gary Oberbrunner
