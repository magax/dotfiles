source $HOME/.antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles
antigen bundle git
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Tell Antigen that you're done.
antigen apply

### HOMEBREW
eval "$(/opt/homebrew/bin/brew shellenv)"
HOMEBREW_NO_AUTO_UPDATE=1

### ALIASES
#
alias vim='nvim'
alias gmc='gitmoji -c'
alias bbd='brew bundle dump -f --global'
#alias flutter-run-dev="flutter run --dart-define=DEV_HOST=$(ipconfig getifaddr en0) "
alias frd="flutter run --web-renderer=canvaskit --dart-define=RUN_EMULATORS=true "
alias emulators="firebase emulators:start --import ./firebase_emulator_data --export-on-exit ./firebase_emulator_data "
alias android="flutter emulators --launch Pixel "
alias ios="flutter emulators --launch iOS"

# ANDROID STUDIO
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# FLUTTER
export PATH="$PATH:$HOME/dev/flutter/bin"
export PATH="$PATH":"$HOME/dev/flutter/.pub-cache/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"

# JAVA
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@11/include"

# NODE
export PATH="/opt/homebrew/opt/node@18/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/node@18/lib"
export CPPFLAGS="-I/opt/homebrew/opt/node@18/include"
