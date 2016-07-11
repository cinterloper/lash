#!/bin/bash
#VARS=( DATA COMMANDS METHOD )
CFG_PATH=$(pwd)/config source config/config.sh
outputEncoder="encodeJson"
reset_chain( )
{
  unset DATE CMD DATA METHOD CMDSTRING
}

run_task( )
{
  export CALLBACK="run_task"
  encode_header_content $CONTENT 2>/dev/null

  if [ "$BACKGROUND" = "TRUE" ]
  then
    printf -v DATE '%(%D-%T)T\n' -1 #
    TASK_ID=$(generate_task_id $DATE)
    KEY_SET='CMD HOSTNAME METHOD DATE TASK_ID' $outputEncoder
    eval $CMDSTRING >> $LOG_PATH/$TASK_ID 2>&1 &
    CMD_PID=$!
    disown $CMD_PID
    KEY_SET='CMD HOSTNAME METHOD DATE CMD_PID TASK_ID' $outputEncoder
  else
    eval $CMDSTRING 2>&1
  fi
}
