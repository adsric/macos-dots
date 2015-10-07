#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
    && source '../utils.sh'

# ------------------------------------------------------------------------------

set_preferences() {

    execute 'defaults write com.apple.mail DisableReplyAnimations -bool true &&
             defaults write com.apple.mail DisableSendAnimations -bool true' \
        'Disable send and reply animations'

    execute 'defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false' \
        'Copy email addresses as "foo@example.com" instead of "Foo Bar <foo@example.com>"'

    execute 'defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" -string "@\\U21a9"' \
        'Add the keyboard shortcut ⌘ + Enter to send an email'

    execute 'defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes" &&
             defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "yes" &&
             defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date"' \
        'Display emails in threaded mode, sorted by date (oldest at the top)'

    execute 'defaults write com.apple.mail DisableInlineAttachmentViewing -bool true' \
        'Disable inline attachments (just show the icons)'

}

# ------------------------------------------------------------------------------

main() {

    print_in_purple '\n  Mail\n\n'
    set_preferences

}

main
