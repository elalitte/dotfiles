# dotfiles
Le repo de mes dotfiles pour avoir une config identique où que j'aille

# En gros
Tmux pour créer des belles sessions et windows.
- tmux new -s toto
- tmux a -t toto  

Vim parce qu'il n'y a pas mieux en IDE.  
Bash pour avoir un joli prompt et les états gits aussi.

# Installation
cd /home/toto  
mkdir toto  
cd toto  
git clone https://github.com/elalitte/dotfiles.git  
cd ..  
mv toto/dotfiles dotfiles  
rm -rf toto  
./dotfiles/installDotfiles.sh

Et zou, plim plam ploum ! tadaaaaa !
