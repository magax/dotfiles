# Get dotfiles
git clone git@github.com:magax/dotfiles.git "$HOME"/dotfiles

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Get Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install brew packages from Brewfile
brew bundle --file "$HOME"/dotfiles/.Brewfile

# Get TMUX plugin manager
git clone https://github.com/tmux-plugins/tpm "$HOME"/.tmux/plugins/tpm

# Create symlinks to Home
ln -s -f "$HOME"/dotfiles/.Brewfile "$HOME"
ln -s -f "$HOME"/dotfiles/.gitconfig "$HOME"
ln -s -f "$HOME"/dotfiles/.tmux.conf "$HOME"
ln -s -f "$HOME"/dotfiles/.zshrc "$HOME"
ln -s -f "$HOME"/dotfiles/nvim "$HOME"
ln -s -f "$HOME"/dotfiles/pretty.zsh-theme "$HOME"/.oh-my-zsh/custom/themes/
