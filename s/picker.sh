#!/usr/bin/env bash

buffer_name="$(readlink -f "$1" 2>/dev/null)"
paths=$(yazi $buffer_name --chooser-file=/dev/stdout)

if [[ -n "$paths" ]]; then
  tmux last-window
  tmux send-keys Escape

  # tmux send-keys -l ":open $paths"

  # open files faster by running the paste command instead of typing the keys one by one
  tmux set-buffer "open $paths"
  tmux send-keys ":"
  tmux paste-buffer -p

  tmux send-keys Enter
else
  tmux kill-window -t fx
fi
