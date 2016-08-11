#!/usr/bin/env bats
source workflow/mulibuild.sh 
@test "publish to maven and github" {
  release
  result=$?
  [ "$result" -eq 0 ]
}

