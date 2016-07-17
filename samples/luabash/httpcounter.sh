#!/bin/bash
# This is a simple lua bash example.

# init lua bash and load code chunk from file internal.lua.


# bash function to be called from within lua context

intfunc ()
{
   bcb $(< fluuid)
}
export -f intfunc

luabash load ./httpcounter.lua
{
  httproute='/shell' registerHdlr intfunc
  startwebapp 8992
} || {
  export fail='true'
}
if [ "$fail" != "true" ]
then
  startev &
fi

