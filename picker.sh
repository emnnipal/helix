#!/usr/bin/env bash

zellij run -c -f -x 10% -y 10% --width 80% --height 80% -- bash ~/.config/helix/yazi_picker.sh open $(realpath $1 2>/dev/null)
