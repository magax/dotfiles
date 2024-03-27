# Get dotfiles
git clone https://github.com/magax/dotfiles.git ~/dotfiles

# Get TMUX plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Get Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install brew packages from Brewfile
brew bundle --file ~/dotfiles/.Brewfile

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Create symlinks to Home
ln -s -f ~/dotfiles/.Brewfile ~
ln -s -f ~/dotfiles/.gitconfig ~
ln -s -f ~/dotfiles/.tmux.conf ~
ln -s -f ~/dotfiles/.zshrc ~
ln -s -f ~/dotfiles/nvim ~
ln -s -f ~/dotfiles/.config ~
