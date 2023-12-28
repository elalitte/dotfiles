#!/bin/bash

# On installe la dernière version de nvim
# On regarde sous quel système on est
systeme=$(uname -a |cut -d " " -f 1)
if [ $systeme = "Darwin" ]
then
  brew install neovim
else 
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
  chmod u+x nvim.appimage
  mv nvim.appimage /usr/local/bin/
  CUSTOM_NVIM_PATH=/usr/local/bin/nvim.appimage
  set -u
  sudo update-alternatives --install /usr/bin/ex ex "${CUSTOM_NVIM_PATH}" 110
  sudo update-alternatives --install /usr/bin/vi vi "${CUSTOM_NVIM_PATH}" 110
  sudo update-alternatives --install /usr/bin/view view "${CUSTOM_NVIM_PATH}" 110
  sudo update-alternatives --install /usr/bin/vim vim "${CUSTOM_NVIM_PATH}" 110
  sudo update-alternatives --install /usr/bin/vimdiff vimdiff "${CUSTOM_NVIM_PATH}" 110
fi

# On teste si tmux existe, et si non, on l'installe
whereis tmux >/dev/null 2<&1
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

# Si le .bashrc existe on le sauvegarde et on créé un lien symbolique vers le nouveau
# Sinon, on créé juste le lien
if [ -f ~/.bashrc ]
then
	mv ~/.bashrc ~/.bashrc.old
	ln -s ~/dotfiles/bash/bashrc ~/.bashrc
else
	ln -s ~/dotfiles/bash/bashrc ~/.bashrc
fi
