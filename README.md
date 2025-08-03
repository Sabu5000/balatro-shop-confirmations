# Balatro Transaction Confirmations

A Balatro mod that adds confirmation dialogs to all card purchases and sales, helping prevent accidental transactions.
Ya, the repo name should be updated, but ehhh

![Mod Version](https://img.shields.io/badge/version-1.0.0-blue)
![Balatro](https://img.shields.io/badge/Balatro-compatible-green)
![Steamodded](https://img.shields.io/badge/requires-Steamodded-orange)

## Features

- **Confirmation dialogs** for ALL card purchases and sales
- **Safety-first design** with "Go Back" as the default option
- **Cost/value display** shows transaction amounts
- **Works everywhere** - selling works in hand, shop, consumables, etc.

## Installation
lol idk

### Prerequisites
- **Balatro** (base game)
- **[Steamodded](https://github.com/Steamodded/smods)** v1.0.0 or higher

### Install Steps
1. Download the latest release from the [Releases page](https://github.com/Sabu5000/balatro-shop-confirmations/releases)
2. Extract the mod files
3. Copy the mod folder to your Steamodded mods directory:
   - **Windows**: `%APPDATA%/Balatro/Mods/`
   - **macOS**: `~/Library/Application Support/Balatro/Mods/`
   - **Linux**: `~/.local/share/Balatro/Mods/`
4. Launch Balatro and check that the mod is enabled in the Mods menu

## How It Works

### Before (without mod):
- Click "Buy" → Item purchased immediately
- Click "Sell" → Card sold immediately
- No way to cancel accidental clicks

### After (with mod):
1. Click "Buy" or "Sell" button
2. Confirmation dialog appears with:
   - **Go Back** (blue, default) - Cancels the action
   - **Continue** (green) - Proceeds with transaction
3. Use arrow keys or mouse to select
4. Press Enter/Space or click to confirm

### Mod not working?
1. Ensure Steamodded is installed and working
2. Check that the mod is enabled in Balatro's Mods menu
3. Verify the mod files are in the correct directory
4. Look for error messages in the Steamodded log

### Missing confirmation for some transactions?
Please [open an issue](https://github.com/Sabu5000/balatro-shop-confirmations/issues) with details about which transaction type isn't covered.

## Credits

- Inspired by [balatro-safety-steamodded](https://github.com/Zei33/balatro-safety-steamodded)
- Built for the [Steamodded](https://github.com/Steamodded/smods) modding framework
- Created with assistance from Claude Code

---

**Enjoy safer Balatro gameplay!**