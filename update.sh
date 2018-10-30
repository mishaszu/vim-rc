NOW=$(date +"%Y-%m-%d")
LOGFILE="vim-backup-$NOW"
mkdir -p ./backup
cp ~/.vimrc ./backup/"$LOGFILE"
cp ./vimrc ~/.vimrc
