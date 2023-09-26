str="-p"

NOW=$(date +"%Y-%m-%d-%m-%s")
LOGFILE="vim-backup-$NOW"
mkdir -p ./backup
 
if [ "$1" = "$str" ];
  then
    cp ./vimrc ./backup/"$LOGFILE"
    cp ~/.vimrc ./vimrc
    echo "Copied global configuration as repo configuration"
  elif [ "$1" = "-h" ];
  then
    echo "- '-p' for coping current configuration to repo\n- no '-p' for coping repo configuration as current"
  else
    cp ~/.vimrc ./backup/"$LOGFILE"
    cp ./vimrc ~/.vimrc
    echo "Copied repo configuration as global configuration"
fi

