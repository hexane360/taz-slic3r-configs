# taz-slic3r-configs

These are my current Slic3r configurations. To use, clone them to ~/.Slic3r (for linux) or %Appdata%\Roaming\Slic3r (for windows). I am using the latest version of Slic3r.
If on linux, the included post-processing script for TAZ6 should automatically copy output to a mounted sd card named "lulzbot". To modify the destination, edit "copy.sh" to point to the location you want to copy.
For windows, change your postprocessing script to "%Appdata%\Roaming\Slic3r\copy.bat". This script copies to any drive mapped to "G:\", "F:\", or "E:\", in that order. Change the list of drive letters on line 5 to modify behaviour.

Profiles starting with "mini" are tested on my LulzBot Mini 1.04, running a fork of Marlin firmware (found on my github)

Profiles starting with "TAZ6" are tested on my Lulzbot TAZ 6, running a fork of Marlin found on my GitHub.

"_dual" prints indicate dual extruder

So far I have only tested PLA and flex filament. The other filament profiles come from LulzBot recommendations.
