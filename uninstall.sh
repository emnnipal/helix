# !/bin/bash

# Uninstall helix
# brew remove \
# 	helix \
# 	lf \

# install LSP related packages
pnpm remove -g \
  typescript \
  typescript-language-server \
  @biomejs/biome \
  @tailwindcss/language-server \
  @olrtg/emmet-language-server \
  vscode-langservers-extracted
# prettier \
# eslint
