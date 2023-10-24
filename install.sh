cp -u ./vimrc ~/.vimrc
mkdir -p ~/.vim
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/swp
mkdir -p ~/.vim/backup
mkdir -p ~/.undodir
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.vim
FILE="~/.config/nvim/init.vim"
if [-f "$FILE"]; then
    echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after\nlet &packpath = &runtimepath\nsource ~/.vimrc" > ~/.config/nvim/init.vim
fi
