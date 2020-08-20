#!/bin/bash

set -e

[ -n "$TRACE" ] && set -x

function op-key-setup() {
  KEY="$HOME/.ssh/$2"
  PUB="$HOME/.ssh/$2.pub"

  op get document "$1" >"$KEY"
  chmod +x "$KEY"

  # Pub key setup
  if [ ! -f "$PUB" ]; then
    ssh-keygen -y -f "$KEY" >"$PUB"
  fi
}

if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
  if ! op-key-setup "Applied SSH Key" id_ed25519; then
    op-signin thebrownhouse
    op-key-setup "Applied SSH Key" id_ed25519
  fi
fi
