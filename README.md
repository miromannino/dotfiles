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

## Applications requirements

- Zsh using prezto (https://github.com/sorin-ionescu/prezto)

- AltTab (https://github.com/lwouis/alt-tab-macos)
  
    ```brew install --cask alt-tab```

- Hammerspoon (https://github.com/Hammerspoon/hammerspoon)
  
    ```brew install --cask hammerspoon```
    
- Karabiner-Elements (https://karabiner-elements.pqrs.org/)

    ```brew install --cask karabiner-elements```

- Goku (https://github.com/yqrashawn/GokuRakuJoudo)

  ```brew install yqrashawn/goku/goku```
 
- Neovim (https://neovim.io/)

  ```brew install neovim```
  
- Neovide (https://github.com/neovide/neovide)

  ```brew install neovide```
