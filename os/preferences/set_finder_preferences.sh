#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")" \
    && source '../utils.sh'

# ------------------------------------------------------------------------------

set_finder_preferences() {

    execute 'defaults write com.apple.finder QuitMenuItem -bool true' \
        'Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons'

    execute 'defaults write com.apple.finder NewWindowTarget -string "PfDe" &&
             defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"' \
        'Finder: set "Desktop" as the default location for new Finder windows'

    execute 'defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true &&
             defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true &&
             defaults write com.apple.finder ShowMountedServersOnDesktop -bool true &&
             defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true' \
        'Finder: Show icons for hard drives, servers, and removable media on the desktop'

    execute 'defaults write NSGlobalDomain AppleShowAllExtensions -bool true' \
        'Finder: show all filename extensions'

    execute 'defaults write com.apple.finder QLEnableTextSelection -bool true' \
        'Finder: allow text selection in Quick Look'

    execute 'defaults write com.apple.finder _FXShowPosixPathInTitle -bool true' \
        'Finder: display full POSIX path as window title'

    execute 'defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"' \
        'Finder: search the current directory by default'

    execute 'defaults write com.apple.finder ShowRecentTags -bool false' \
        'Finder: do not show recent tags'

    execute 'defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false' \
        'Finder: disable warning when changing a file extension'

    execute 'defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true' \
        'Finder: avoid creating .DS_Store files on network volumes'

    execute 'defaults write com.apple.frameworks.diskimages skip-verify -bool true &&
             defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true &&
             defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true' \
        'Finder: disable disk image verification'

    execute 'defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true &&
             defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true &&
             defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true' \
        'Finder: automatically open a new Finder window when a volume is mounted'

    execute 'defaults write com.apple.finder DisableAllAnimations -bool true' \
        'Finder: disable all animations'

    execute '/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist &&
             /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist &&
             /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist' \
        'Finder: show item info'

    execute '/usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist' \
        'Finder: show item info to the right of the icons on the desktop'

    execute '/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy none" ~/Library/Preferences/com.apple.finder.plist &&
             /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy none" ~/Library/Preferences/com.apple.finder.plist &&
             /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy none" ~/Library/Preferences/com.apple.finder.plist' \
        'Finder: enable snap-to-grid for icons on the desktop and in other icon views'

    execute '/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist &&
             /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist &&
             /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist' \
        'Finder: increase grid spacing for icons on the desktop and in other icon views'

    execute '/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 72" ~/Library/Preferences/com.apple.finder.plist &&
             /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 72" ~/Library/Preferences/com.apple.finder.plist &&
             /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 72" ~/Library/Preferences/com.apple.finder.plist' \
        'Finder: increase the size of icons on the desktop and in other icon views'

    execute 'defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"' \
        'Finder: use list view in all Finder windows by default'

    execute 'defaults write com.apple.finder WarnOnEmptyTrash -bool false' \
        'Finder: disable the warning before emptying the Trash'

}

# ------------------------------------------------------------------------------

main() {

    print_in_purple '\n  Finder\n\n'
    set_finder_preferences

    killall 'Finder' &> /dev/null

}

main
