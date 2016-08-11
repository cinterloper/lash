#!/usr/bin/env bats
source workflow/mulibuild.sh 
@test "build kvdn base" {
  build
  result=$?
  [ "$result" -eq 0 ]
}

