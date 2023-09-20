#!/bin/bash
set -e

# go backwards in history, commit by commit, and see if any file created in that commit was copied
# from another existing file (default 50% likeness).
# Ctrl-C to stop searching.
count=0
while :
do
  git diff --find-copies-harder --name-status HEAD~$((count+1)) HEAD~$count | grep '^C'
  (( count++ ))
done
