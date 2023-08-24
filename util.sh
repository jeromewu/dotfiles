#!/bin/bash

check_deps() {
  echo "Check dependencies..."
  for cmd in $@
  do
    command -v $cmd > /dev/null 2>&1 || \
      { echo >&2 "$cmd is required for this script. Aborting"; exit 1; }
  done
}
