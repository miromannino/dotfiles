
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

### Zsh using prezto 

https://github.com/sorin-ionescu/prezto

Install:

```
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```

Create default configuration folder for it
```
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```
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
    
  - Vim Plug
  
    ```
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    ```
       
     On VIM do `:PlugInstall` or `:PlugUpdate` to install or update them after changing `~/.config/nvim/init.vim`
     
     
  
  
