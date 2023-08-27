
# dotfiles

This repository has been created with the following commands:

```
git init --bare $HOME/.dotfiles.git
echo 'alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"' >> $HOME/.zshrc
source ~/.zshrc
dotfiles config --local status.showUntrackedFiles no
```

To add new files to the configuration, you can use the `dotfiles` alias in the following way:

```
dotfiles add .vimrc
dotfiles commit -m "add .vimrc"
dotfiles push origin master
```

To apply the configuration to another machine, the following commands can be used:

```
echo 'alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"' >> $HOME/.zshrc
source ~/.zshrc
git clone --bare git@github.com:miromannino/dotfiles.git $HOME/.dotfiles.git
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

## Requirements

### Zsh using Oh My Zsh and Powerlevel10k

Install Oh My Zsh

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

Install Powerlevel10k

  git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

Installing Plugins (full list available at: https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins)

  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-history-substring-search $ZSH_CUSTOM/plugins/zsh-history-substring-search
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

Take changes into account

  source ~/.zshrc

### AltTab 

https://github.com/lwouis/alt-tab-macos
  
Install
 
```
brew install --cask alt-tab
```

### Hammerspoon 

https://github.com/Hammerspoon/hammerspoon)
  
```
brew install --cask hammerspoon
```
    
### Karabiner-Elements

https://karabiner-elements.pqrs.org/

```
brew install --cask karabiner-elements
```
    
### iTerm2 

https://iterm2.com/

```
brew install --cask iterm2
```

Set One Dark Pro theme in iTerm from 

```
https://github.com/chinhsuanwu/one-dark-pro-iterm
```

### Tmux

Install Tmux Plugin Manager

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

These dotfiles in this repository will have a configuration file for tmux in .config/tmux/tmux.config

Run in `tmux` the following

```
tmux source-file .config/tmux/tmux.conf
```

And also in tmux, press ctrl+b + I to install the plugins.

### Nerd fonts

https://github.com/ryanoasis/nerd-fonts#option-4-homebrew-fonts

 ```
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
```

iTerm2 in `Preferences... -> Profiles -> Text -> Font` should be automatically set to use `Hack Nerd Font Mono` through these dotfiles.

### VIM

  - Neovim (https://neovim.io/)

    ```brew install neovim```
     
  
  
