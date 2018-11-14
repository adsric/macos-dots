#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
	&& . "utils.sh"

# ------------------------------------------------------------------------------

print_in_purple "\n • Preferences\n\n"

ask_for_confirmation 'Do you want to set the macOS preferences?'
printf '\n'

if answer_is_yes; then

	# --------------------------------------------------------------------------

	print_in_purple "\n  Dock\n\n"

	execute "defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true" \
		"Enable spring loading for all Dock items"

	execute "defaults write com.apple.dock expose-group-by-app -bool false" \
		"Do not group windows by application in Mission Control"

	execute "defaults write com.apple.dock mineffect -string 'scale'" \
		"Change minimize/maximize window effect"

	execute "defaults write com.apple.dock minimize-to-application -bool true" \
		"Reduce clutter by minimizing windows into their application icons"

	execute "defaults write com.apple.dock mru-spaces -bool false" \
		"Do not automatically rearrange spaces based on most recent use"

	execute "defaults write com.apple.dock show-process-indicators -bool true" \
		"Show indicator lights for open applications"

	execute "defaults write com.apple.dock showhidden -bool true" \
		"Make icons of hidden applications translucent"

	killall "Dock" &> /dev/null

	# --------------------------------------------------------------------------

	print_in_purple "\n  Finder\n\n"

	execute "defaults write com.apple.finder _FXShowPosixPathInTitle -bool true" \
		"Use full POSIX path as window title"

	execute "defaults write com.apple.finder WarnOnEmptyTrash -bool false" \
		"Disable the warning before emptying the Trash"

	execute "defaults write com.apple.finder FXDefaultSearchScope -string 'SCcf'" \
		"Search the current directory by default"

	execute "defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false" \
		"Disable warning when changing a file extension"

	execute "defaults write com.apple.finder FXPreferredViewStyle -string 'Nlsv'" \
		"Use list view in all Finder windows by default"

	execute "defaults write com.apple.finder ShowRecentTags -bool false" \
		"Do not show recent tags"

	execute "defaults write -g AppleShowAllExtensions -bool true" \
		"Show all filename extensions"

	killall "Finder" &> /dev/null

	# --------------------------------------------------------------------------

	print_in_purple "\n  Keyboard\n\n"

	execute "defaults write -g AppleKeyboardUIMode -int 3" \
		"Enable full keyboard access for all controls"

	execute "defaults write -g ApplePressAndHoldEnabled -bool false" \
		"Disable press-and-hold in favor of key repeat"

	execute "defaults write -g 'InitialKeyRepeat_Level_Saved' -int 10" \
		"Set delay until repeat"

	execute "defaults write -g KeyRepeat -int 1" \
		"Set the key repeat rate to fast"

	execute "defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false" \
		"Disable smart quotes"

	execute "defaults write -g NSAutomaticDashSubstitutionEnabled -bool false" \
		"Disable smart dashes"

	# --------------------------------------------------------------------------

	print_in_purple "\n  Safari\n\n"

	execute "defaults write com.apple.Safari AutoOpenSafeDownloads -bool false" \
		"Disable opening 'safe' files automatically"

	execute "defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true" \
		"Set backspace key to go to the previous page in history"

	execute "defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true && \
			defaults write com.apple.Safari IncludeDevelopMenu -bool true && \
			defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true" \
		"Enable the 'Develop' menu and the 'Web Inspector'"

	execute "defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false" \
		"Set search type to 'Contains' instead of 'Starts With'"

	execute "defaults write com.apple.Safari HomePage -string 'about:blank'" \
		"Set home page to 'about:blank'"

	execute "defaults write com.apple.Safari IncludeInternalDebugMenu -bool true" \
		"Enable 'Debug' menu"

	execute "defaults write com.apple.Safari ShowFavoritesBar -bool false" \
		"Hide bookmarks bar by default"

	execute "defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true" \
		"Show the full URL in the address bar"

	execute "defaults write com.apple.Safari SuppressSearchSuggestions -bool true && \
			defaults write com.apple.Safari UniversalSearchEnabled -bool false" \
		"Don’t send search queries to Apple"

	execute "defaults write -g WebKitDeveloperExtras -bool true" \
		"Add a context menu item for showing the 'Web Inspector' in web views"

	killall "Safari" &> /dev/null

	# --------------------------------------------------------------------------

	print_in_purple "\n  Terminal\n\n"

	execute "defaults write com.apple.terminal FocusFollowsMouse -string true" \
		"Make the focus automatically follow the mouse"

	execute "defaults write com.apple.terminal SecureKeyboardEntry -bool true" \
		"Enable 'Secure Keyboard Entry'"

	execute "defaults write com.apple.Terminal ShowLineMarks -int 0" \
		"Hide line marks"

	execute "defaults write com.apple.terminal StringEncodings -array 4" \
		"Only use UTF-8"

	# Ensure the Touch ID is used when `sudo` is required.

	if ! grep -q "pam_tid.so" "/etc/pam.d/sudo"; then
		execute "sudo sh -c 'echo \"auth sufficient pam_tid.so\" >> /etc/pam.d/sudo'" \
			"Use Touch ID to authenticate sudo"
	fi

	# --------------------------------------------------------------------------

	print_in_purple "\n  Trackpad\n\n"

	execute "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true && \
			defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1 && \
			defaults write -g com.apple.mouse.tapBehavior -int 1 && \
			defaults -currentHost write -g com.apple.mouse.tapBehavior -int 1" \
		"Enable 'Tap to click'"

	execute "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true && \
			defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -int 1 && \
			defaults -currentHost write -g com.apple.trackpad.enableSecondaryClick -bool true && \
			defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 0 && \
			defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 0 && \
			defaults -currentHost write -g com.apple.trackpad.trackpadCornerClickBehavior -int 0" \
		"Map 'click or tap with two fingers' to the secondary click"

	# --------------------------------------------------------------------------

	print_in_purple "\n  UI & UX\n\n"

	execute "defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true" \
	"Avoid creating '.DS_Store' files on network volumes"

	execute "defaults write com.apple.menuextra.battery ShowPercent -string 'NO'" \
		"Hide battery percentage from the menu bar"

	execute "defaults write com.apple.CrashReporter UseUNC 1" \
		"Make crash reports appear as notifications"

	execute "defaults write com.apple.LaunchServices LSQuarantine -bool false" \
		"Disable 'Are you sure you want to open this application?' dialog"

	execute "defaults write com.apple.print.PrintingPrefs 'Quit When Finished' -bool true" \
		"Automatically quit the printer app once the print jobs are completed"

	execute "defaults write com.apple.screencapture disable-shadow -bool true" \
		"Disable shadow in screenshots"

	execute "defaults write com.apple.screencapture location -string '$HOME/Desktop'" \
		"Save screenshots to the Desktop"

	execute "defaults write com.apple.screencapture type -string 'png'" \
		"Save screenshots as PNGs"

	execute "defaults write com.apple.screensaver askForPassword -int 1 && \
			defaults write com.apple.screensaver askForPasswordDelay -int 0"\
		"Require password immediately after into sleep or screen saver mode"

	execute "defaults write -g AppleFontSmoothing -int 2" \
		"Enable subpixel font rendering on non-Apple LCDs"

	execute "defaults write -g AppleShowScrollBars -string 'Always'" \
		"Always show scrollbars"

	execute "defaults write -g NSDisableAutomaticTermination -bool true" \
		"Disable automatic termination of inactive apps"

	execute "defaults write -g NSNavPanelExpandedStateForSaveMode -bool true" \
		"Expand save panel by default"

	execute "defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false" \
		"Disable resume system-wide"

	execute "defaults write -g PMPrintingExpandedStateForPrint -bool true" \
		"Expand print panel by default"

	execute "sudo systemsetup -setrestartfreeze on" \
		"Restart automatically if the computer freezes"

	execute "for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
				sudo defaults write \"\${domain}\" dontAutoLoad -array \
					'/System/Library/CoreServices/Menu Extras/TimeMachine.menu' \
					'/System/Library/CoreServices/Menu Extras/Volume.menu'
			done \
				&& sudo defaults write com.apple.systemuiserver menuExtras -array \
					'/System/Library/CoreServices/Menu Extras/Bluetooth.menu' \
					'/System/Library/CoreServices/Menu Extras/AirPort.menu' \
					'/System/Library/CoreServices/Menu Extras/Battery.menu' \
					'/System/Library/CoreServices/Menu Extras/Clock.menu'
			" \
		"Hide Time Machine and Volume icons from the menu bar"

	killall "SystemUIServer" &> /dev/null

fi
