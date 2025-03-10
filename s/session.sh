#!/usr/bin/env bash

SESSION_DIR="/tmp/hx_sessions"
mkdir -p "$SESSION_DIR"

# Convert PWD into a valid filename by replacing '/' with '_'
SESSION_FILE="$SESSION_DIR/${PWD//\//_}"

add_session() {
  local file_path="$(realpath "$1")"

  if [[ ! -f "$file_path" ]]; then
    echo "Error: File does not exist."
    return 1 # Return instead of exit
  fi

  # Remove previous occurrence, then append at the bottom
  awk -v f="$file_path" '$0 != f' "$SESSION_FILE" >"$SESSION_FILE.tmp"
  echo "$file_path" >>"$SESSION_FILE.tmp"
  mv "$SESSION_FILE.tmp" "$SESSION_FILE"

  echo "Added to session: $file_path"
}

restore_session() {
  if [[ ! -f "$SESSION_FILE" || ! -s "$SESSION_FILE" ]]; then
    echo "No saved session for this directory."
    exit 0
  fi

  paths=$(tr '\n' ' ' <"$SESSION_FILE")

  if [[ -n "$paths" ]]; then
    tmux send-keys Escape
    tmux set-buffer "open $paths"
    tmux send-keys ":"
    tmux paste-buffer -p
    tmux send-keys Enter

    echo "Session restored"
  fi
}

list_sessions() {
  if [[ ! -f "$SESSION_FILE" ]]; then
    echo "No saved session for this directory."
    exit 0
  fi

  while IFS= read -r file_path; do
    echo "${file_path#$PWD/}" # Remove the PWD part but keep the relative path
  done <"$SESSION_FILE"
}

remove_session() {
  local file_path="$(realpath "$1")"

  if [[ ! -f "$SESSION_FILE" ]]; then
    echo "No saved session for this directory."
    exit 0
  fi

  # Use compatible `sed -i` for macOS and Linux
  if [[ "$(uname)" == "Darwin" ]]; then
    sed -i '' "\|^$file_path\$|d" "$SESSION_FILE"
  else
    sed -i "\|^$file_path\$|d" "$SESSION_FILE"
  fi

  echo "Removed from session: $1"
}

clear_sessions() {
  rm -f "$SESSION_FILE"
  echo "Cleared session for this directory."
}

case "$1" in
add) add_session "$2" ;;
restore) restore_session ;;
list) list_sessions ;;
remove) remove_session "$2" ;;
clear) clear_sessions ;;
*)
  echo "Usage: $0 {add|restore|list|remove|clear} [file]"
  exit 0
  ;;
esac
