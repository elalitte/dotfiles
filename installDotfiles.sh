#!/bin/bash

# On teste si nvim existe, et si non, on l'installe
whereis nvim >/dev/null 2<&1
if [ $? -eq 0 ]
then
  "Neovim est déjà installé"
else
  # On regarde sous quel système on est
  systeme=$(uname -a |cut -d " " -f 1)
  if [ $systeme = "Darwin" ]
  then
    brew install neovim
  else 
    apt-get install neovim
fi

# Si le répertoire de configuration nvim existe on le sauvegarde et on créé un
# lien symbolique vers le nouveau. Sinon, on créé juste le lien
if [ -d ~/.config/nvim ]
then
	mv ~/.config/nvim ~/.config/nvim.old
	ln -s ~/dotfiles/nvim/ ~/.config/
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
