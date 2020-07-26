cp -u ./vimrc ~/.vimrc
mkdir -p ~/.vim
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/swp
mkdir -p ~/.vim/backup
mkdir -p ~/.undodir
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
