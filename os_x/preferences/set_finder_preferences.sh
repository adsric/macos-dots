#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
    && source '../utils.sh'

# ------------------------------------------------------------------------------

set_finder_preferences() {

    execute 'defaults write com.apple.finder QuitMenuItem -bool true' \
        'Allow quitting via ⌘ + Q; doing so will also hide desktop icons'

    execute 'defaults write com.apple.finder NewWindowTarget -string "PfDe" &&
             defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"' \
        'Set "Desktop" as the default location for new Finder windows'

    execute 'defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true &&
             defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true &&
             defaults write com.apple.finder ShowMountedServersOnDesktop -bool true &&
             defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true' \
        'Show icons for hard drives, servers, and removable media on the desktop'

    execute 'defaults write NSGlobalDomain AppleShowAllExtensions -bool true' \
        'Show all filename extensions'

    execute 'defaults write com.apple.finder QLEnableTextSelection -bool true' \
        'Allow text selection in Quick Look'

    execute 'defaults write com.apple.finder _FXShowPosixPathInTitle -bool true' \
        'Display full POSIX path as window title'

    execute 'defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"' \
        'Search the current directory by default'

    execute 'defaults write com.apple.finder ShowRecentTags -bool false' \
        'Do not show recent tags'

    execute 'defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false' \
        'Disable warning when changing a file extension'

    execute 'defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true' \
        'Avoid creating .DS_Store files on network volumes'

    execute 'defaults write com.apple.frameworks.diskimages skip-verify -bool true &&
             defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true &&
             defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true' \
        'Disable disk image verification'

    execute 'defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true &&
             defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true &&
             defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true' \
        'Automatically open a new Finder window when a volume is mounted'

    execute 'defaults write com.apple.finder DisableAllAnimations -bool true' \
        'Disable all animations'

    execute '/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist &&
             /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist &&
             /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist' \
        'Show item info'

    execute '/usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist' \
        'Show item info to the right of the icons on the desktop'

    execute '/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy none" ~/Library/Preferences/com.apple.finder.plist &&
             /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy none" ~/Library/Preferences/com.apple.finder.plist &&
             /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy none" ~/Library/Preferences/com.apple.finder.plist' \
        'Enable snap-to-grid for icons on the desktop and in other icon views'

    execute '/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist &&
             /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist &&
             /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist' \
        'Increase grid spacing for icons on the desktop and in other icon views'

    execute '/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 72" ~/Library/Preferences/com.apple.finder.plist &&
             /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 72" ~/Library/Preferences/com.apple.finder.plist &&
             /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 72" ~/Library/Preferences/com.apple.finder.plist' \
        'Increase the size of icons on the desktop and in other icon views'

    execute 'defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"' \
        'Use list view in all Finder windows by default'

    execute 'defaults write com.apple.finder WarnOnEmptyTrash -bool false' \
        'Disable the warning before emptying the Trash'

}

# ------------------------------------------------------------------------------

main() {

    print_in_purple '\n  Finder\n\n'
    set_finder_preferences

  killall 'Finder' &> /dev/null

}

main
