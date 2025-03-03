#!/usr/bin/env bash

buffer_name="$(readlink -f "$1" 2>/dev/null)"
paths=$(yazi $buffer_name --chooser-file=/dev/stdout)

if [[ -n "$paths" ]]; then
  tmux last-window
  tmux send-keys Escape
  tmux send-keys ":open $paths"
  tmux send-keys Enter
else
  tmux kill-window -t fx
fi
