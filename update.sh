str="--save"
str2="--overwrite"

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
    echo "- '--save' for coping current configuration to repo\n- '--overwrite' for coping repo configuration as current"
  elif [ "$1" = "$str2" ];
  then
    cp ~/.vimrc ./backup/"$LOGFILE"
    cp ./vimrc ~/.vimrc
    echo "Copied repo configuration as global configuration"
  else
    echo "- '--save' for coping current configuration to repo\n- '--overwrite' for coping repo configuration as current"
fi

