# !/bin/bash

# Uninstall helix
# brew remove \
# 	helix \
# 	lf \

# Uninstall LSP related packages
pnpm remove -g \
  typescript \
  @biomejs/biome \
  @tailwindcss/language-server \
  @olrtg/emmet-language-server \
  vscode-langservers-extracted \
  yaml-language-server \
  prettier \
  bash-language-server \
  @vtsls/language-server
# typescript-language-server \
# eslint \

# uninstall LSP packages instaleld using brew
# brew uninstall \
#   taplo \
#   shfmt # formatter for shell/bash files
