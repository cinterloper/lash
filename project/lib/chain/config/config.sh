for cfg in $(cat $CFG_PATH/include.list)
do
  {
    source $cfg
  } || {
    echo "failed to source $cfg"
  }
done
