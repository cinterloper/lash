#!/usr/bin/env bash
enable -f ./build/luabash.so luabash

function luaSlurp { #lua_dostring would make this unnecessary
    TMPFL=$(mktemp /tmp/XXXXXX.lua)
    while read line; do
        echo $line>>$TMPFL
    done
    luabash load $TMPFL
    rm $TMPFL
}

# your mommas code

luaSlurp <<EOF
    function add (a,b)
      print("hello lua")
      local sum = 0
      sum = a + b
      bash.setVariable("RESULT",sum)
    end
    bash.register("add")
EOF

add 1 2
echo $RESULT

