#!/bin/bash
WD=$(pwd)
enable -f $LASH_PATH/bin/luabash.so luabash
cd $LASH_PATH/lib/jstruct/
source jstruct.sh
cd $WD
export PATH=$PATH:$LASH_PATH/bin


