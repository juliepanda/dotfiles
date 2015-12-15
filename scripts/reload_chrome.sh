#!/bin/bash

# This script use AppleScript to reload a tab in Chrome then go back to iTerm.
# Takes 1 link as argument.
# e.g. reload_chrome.sh 'https://google.com'

echo
echo "reload Chrome"
LINK="$1"
echo $LINK
osascript <<EOD
    set u to "$LINK"
    tell application "Google Chrome"
        repeat with w in windows
            set i to 0
            repeat with t in tabs of w
                set i to i + 1
                if URL of t is u then
                    set active tab index of w to i
                    set index of w to 1
                    tell t to reload
                    activate
                    return
                end if
            end repeat
        end repeat
        open location u
        activate
    end tell
EOD
osascript <<EOD
    tell application "iTerm"
        activate
    end tell
EOD
