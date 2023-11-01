# Night City Rewind

Night City Rewind allows you to replay minor activities, mainly focusing on combat encounters.
Right now you can infinitely replay [NCPD scanner missions](https://github.com/psiberx/cp2077-rewind/wiki/Activities).

The mod is still in development.

## Getting Started

### Requirements

- Cyberpunk 2077 2.02
- [Codeware](https://github.com/psiberx/cp2077-codeware) 1.6.0+
- [redscript](https://github.com/jac3km4/redscript) 0.5.16+

### Installation

1. Install all requirements
2. Download [the latest release](https://github.com/psiberx/cp2077-rewind/releases) archive
3. Extract the archive into the Cyberpunk 2077 installation directory

### Save file backups

Always make a manual save before using any mods, especially those in development.

It's also recommended to keep copies of your save files outside of the default location 
in case you accidentally overwrite or delete saves in game or have problems with cloud sync.

## How to use

Current version of the mod doesn't restart activities automatically and requires you 
to run [Cyber Engine Tweaks](https://github.com/yamashi/CyberEngineTweaks) console commands.
Some commands require activity names and other parameters which you can all find in this 
[list of activities](https://github.com/psiberx/cp2077-rewind/wiki/Activities).

**`NightCityRewind.Activate(name)`**

Starts one named activity. For example, `NightCityRewind.Activate("ma_hey_spr_11")`.

**`NightCityRewind.ActivateAll()`**

Starts all available activies.

Optionally, you can set additional criteria for this command:

- **`:InDistrict(name)`** selects activities from given district (can be applied multiple times) 
- **`:CooledDownFor(seconds)`** selects activities that was last completed X seconds ago

For example, `NightCityRewind.ActivateAll():InDistrict("Kabuki")` 
or `NightCityRewind.ActivateAll():InDistrict("Pacifica"):CooledDownFor(300)`.

## Important notes

- Activity must be completed at least once before it can be restarted with the mod.
- Activity cannot be restarted if you're too close to it.  
  For activities with NPCs, you must move at least 100m away.   
  For activities with vehicles, you must move at least 200m away.
- When replaying NCPD mission, the area can be crowded with more civilians that aren't there on first encounter. 

## Current plans

- Restart activities automatically based on a schedule
- Revive cyberpsychos and minibosses without restarting their related quests
