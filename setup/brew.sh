#!/bin/bash

set -e

[ -n "$TRACE" ] && set -x

if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi
