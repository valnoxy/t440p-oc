#!/bin/bash

echo "Uninstalling ALCPlugFix.  Root user is required."

sudo rm /usr/local/bin/ALCPlugFix
sudo rm /usr/local/bin/hda-verb
sudo launchctl unload -w /Library/LaunchDaemons/good.win.ALCPlugFix.plist
sudo launchctl remove good.win.ALCPlugFix
sudo rm /Library/LaunchDaemons/good.win.ALCPlugFix.plist

echo "Done!"
exit 0
