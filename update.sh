NOW=$(date +"%Y-%m-%d-%m-%s")
LOGFILE="vim-backup-$NOW"
mkdir -p ./backup
cp ~/.vimrc ./backup/"$LOGFILE"
cp ./vimrc ~/.vimrc
