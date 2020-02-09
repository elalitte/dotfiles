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

# Installation de vundle pour vim
# On vérifie que les répertoires existent sinon on les créé
if [ -d ~/.vim ]
	echo "Le repertoire .vim existe déjà"
else
	mkdir ~/.vim
fi
if [ -d ~/.vim/bundle ]
	echo "Le repertoire .vim existe déjà"
else
	mkdir ~/.vim/bundle
fi
# On clone vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Et on installe les plugins
vim +PluginInstall +qall
