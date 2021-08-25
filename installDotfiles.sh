#!/bin/bash

# Si le .vimrc existe on le sauvegarde et on créé un lien symbolique vers le nouveau
# Sinon, on créé juste le lien
if [ -f ~/.vimrc ]
then
	mv ~/.vimrc ~/.vimrc.old
	ln -s ~/dotfiles/vim/vimrc ~/.vimrc
else
	ln -s ~/dotfiles/vim/vimrc ~/.vimrc
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

# Installation de vundle pour vim
# On vérifie que les répertoires existent sinon on les créé
if [ -d ~/.vim ]
then
	echo "Le repertoire .vim existe déjà"
else
	mkdir ~/.vim
fi
if [ -d ~/.vim/bundle ]
then
	echo "Le repertoire .vim existe déjà"
else
	mkdir ~/.vim/bundle
fi
# On clone vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Et on installe les plugins
vim +PluginInstall +qall

# Ajout des skeletons par défaut pour les extensions de fichiers
if [ -d ~/vim ]
then
	echo "Le repertoire vim existe déjà"
else
	mkdir ~/vim/
	ln -s ~/dotfiles/vim/skeletons/* ~/vim/
fi
