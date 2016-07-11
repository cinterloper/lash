#@params input: [string](cmdname),[string](methodname)
#@vars CMD METHOD
lookup_command () {
  if [ "$CMD" == "" ]
  then
    $CMD=$1
    $METHOD=$2
  fi
  export CMDSTRING=$(get_config | jq -rc "."$CMD"|."$METHOD".CMD" | grep -v null )
  export CONTENT=$(get_config | jq -rc "."$CMD"|."$METHOD".CType" | grep -v null )
}

