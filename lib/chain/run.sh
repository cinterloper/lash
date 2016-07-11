export CFG_PATH=$(pwd)/config
source  config/config.sh
source chain.sh
vxc -l -n cmds | while read JSON_STRING
  do
    echo $JSON_STRING
    METHOD=EB
    decodeJson && lookup_command && run_task
    reset_chain
  done
