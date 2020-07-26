str="-p"

NOW=$(date +"%Y-%m-%d-%m-%s")
LOGFILE="vim-backup-$NOW"
mkdir -p ./backup
 
if [ "$1" = "$str" ];
  then
    cp ./vimrc ./backup/"$LOGFILE"
    cp ~/.vimrc ./vimrc
    echo "Copied global configuration as repo configuration"
  else
    cp ~/.vimrc ./backup/"$LOGFILE"
    cp ./vimrc ~/.vimrc
    echo "Copied repo configuration as global configuration"
fi

