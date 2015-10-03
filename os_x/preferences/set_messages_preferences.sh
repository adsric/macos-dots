#!/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
    && source '../utils.sh'

# ------------------------------------------------------------------------------

set_messages_preferences() {

    execute 'defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false' \
        'Disable automatic emoji substitution (i.e. use plain text smileys)'

    execute 'defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false' \
        'Disable smart quotes as it’s annoying for messages that contain code'

    execute 'defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false' \
        'Disable continuous spell checking'

}

# ------------------------------------------------------------------------------

main() {

    print_in_purple '\n  Messages\n\n'
    set_messages_preferences

}

main
