#!/bin/bash

# On installe la dernière version de neovim
# On regarde sous quel système on est
systeme=$(uname -a |cut -d " " -f 1)
if [ $systeme = "Darwin" ]
# Si c'est mac on installe avec brew
then
  brew install neovim
# Sinon on installe avec la dernière version image pour linux
else
  # On regarde si on a les outils dont on dépend par la suite
  # sudo
  dpkg -l |grep sudo 2>&1 >/dev/null
  if [ $? -ne 0 ]
  then
    apt install -y sudo
  fi
  # curl
  dpkg -l |grep curl 2>&1 >/dev/null
  if [ $? -ne 0 ]
  then
    apt install -y curl
  fi
  # wget
  dpkg -l |grep wget 2>&1 >/dev/null
  if [ $? -ne 0 ]
  then
    apt install -y wget
  fi
  # unzip
  dpkg -l |grep unzip 2>&1 >/dev/null
  if [ $? -ne 0 ]
  then
    apt install -y unzip
  fi
  # gcc
  dpkg -l |grep gcc 2>&1 >/dev/null
  if [ $? -ne 0 ]
  then
    apt install -y gcc
  fi
  # luarocks
  dpkg -l |grep luarocks 2>&1 >/dev/null
  if [ $? -ne 0 ]
  then
    apt install -y luarocks
  fi
  # ripgrep
  dpkg -l |grep ripgrep 2>&1 >/dev/null
  if [ $? -ne 0 ]
  then
    apt install -y ripgrep
  fi

  [ -d /etc/apt/keyrings ] || sudo mkdir -p /etc/apt/keyrings
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
  chmod u+x ./nvim-linux-x86_64.appimage
  mv nvim-linux-x86_64.appimage /usr/local/bin/
  CUSTOM_NVIM_PATH=/usr/local/bin/nvim-linux-x86_64.appimage
  set -u
  sudo update-alternatives --install /usr/bin/ex ex "${CUSTOM_NVIM_PATH}" 110
  sudo update-alternatives --install /usr/bin/vi vi "${CUSTOM_NVIM_PATH}" 110
  sudo update-alternatives --install /usr/bin/view view "${CUSTOM_NVIM_PATH}" 110
  sudo update-alternatives --install /usr/bin/vim vim "${CUSTOM_NVIM_PATH}" 110
  sudo update-alternatives --install /usr/bin/vimdiff vimdiff "${CUSTOM_NVIM_PATH}" 110
fi

# On installe un clipboard manager pour pouvoir copier coller entre nvim et le systeme
if [ $systeme = "Darwin" ]
then
  brew install pbcopy
else
  apt install -y xclip
fi

# On installe npm notamment pour neovim
if [ $systeme = "Darwin" ]
# Si c'est mac on installe avec brew
then
  brew install node
else
  sudo apt-get update && sudo apt-get install -y ca-certificates curl gnupg sudo
  curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
  # Version à changer en fonction de l'évolution de node (à voir si scriptable)
  NODE_MAJOR=20
  echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
  sudo apt-get update && sudo apt-get install nodejs -y
fi

# On installe nerd-fonts
if [ $systeme = "Darwin" ]
then
  brew tap homebrew/cask-fonts
  brew install --cask font-hack-nerd-font
else
  mkdir /usr/share/fonts/Hack
  cd /usr/share/fonts/Hack
  apt install -y fontconfig
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip
  unzip Hack.zip
  fc-cache -fv
fi

# On teste si tmux existe, et si non, on l'installe
which tmux >/dev/null 2<&1
if [ $? -eq 0 ]
then
  echo "tmux est deja installe"
else
  # On regarde sous quel système on est
  systeme=$(uname -a |cut -d " " -f 1)
  if [ $systeme = "Darwin" ]
  then
    brew install tmux
  else
    apt-get -y install tmux
  fi
fi

# Si le répertoire de configuration nvim existe on le sauvegarde et on créé un
# lien symbolique vers le nouveau. Sinon, on créé juste le lien
if [ -d ~/.config/nvim ]
then
  mv ~/.config/nvim ~/.config/nvim.old
  ln -s ~/dotfiles/nvim/ ~/.config/
  rm -rf ~/.local/share/nvim
  rm -rf ~/.local/state/nvim
else
  if [ -d ~/.config ]
  then
    ln -s ~/dotfiles/nvim/ ~/.config/
  else
    mkdir ~/.config/
    ln -s ~/dotfiles/nvim/ ~/.config/
  fi
fi

# Si le .tmux.conf existe on le sauvegarde et on créé un lien symbolique vers le nouveau
# Sinon, on créé juste le lien
if [ -f ~/.tmux.conf ]
then
  mv ~/.tmux.conf ~/.tmux.conf.old
  ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
else
  ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
fi

# Selon si on est sous macos (zsh) ou linux (bash) on installe le bon fichier de configuration
if [ $systeme = "Darwin" ]
# Si le .bashrc (.zshrc) existe on le sauvegarde et on créé un lien symbolique vers le nouveau
# Sinon, on créé juste le lien
then
  if [ -f ~/.zshrc ]
  then
    mv ~/.zshrc ~/.zshrc.old
    ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
  else
    ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
  fi
  if [ -f ~/.zprofile ]
  then
    mv ~/.zprofile ~/.zprofile.old
    ln -s ~/dotfiles/zsh/zprofile ~/.zprofile
  else
    ln -s ~/dotfiles/zsh/zprofile ~/.zprofile
  fi
else
  if [ -f ~/.bashrc ]
  then
    mv ~/.bashrc ~/.bashrc.old
    ln -s ~/dotfiles/bash/bashrc ~/.bashrc
  else
    ln -s ~/dotfiles/bash/bashrc ~/.bashrc
  fi
fi

# Installation de exa pour avoir des couleurs dans ls
if [ $systeme = "Darwin" ]
then
  brew install exa
else
  apt install -y exa
fi

# Installation de bat pour avoir un cat avec des couleurs
if [ $systeme = "Darwin" && ! -f /opt/homebrew/bin/bat ]
then
  brew install bat
elif [ ! -f /usr/bin/batcat ]
then
  apt install -y bat
fi
