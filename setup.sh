# DOTFILES
git clone https://github.com/magax/dotfiles.git

# TMUX plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# HOMEBREW
cd ~ && mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
brew bundle --file ~/dotfiles/Brewfile
