export ZSH="/Users/maxjanvier/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

eval $(/opt/homebrew/bin/brew shellenv)

# ALIASES
alias flutter-run-dev="flutter run --dart-define=DEV_HOST=$(ipconfig getifaddr en0) "
alias firebase-emulators-start="firebase emulators:start --import ./firebase_emulator_suite --export-on-exit ./firebase_emulator_suite"
alias android-emulator="flutter emulators --launch Pixel_4_API_32 --cold"

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

export GOPATH=$HOME/go
export GOROOT="$(brew --prefix go)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
export GOBIN=$GOPATH/bin
