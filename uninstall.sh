# !/bin/bash

# install helix
# brew remove \
# 	helix \
# 	lf \

# install LSP related packages
pnpm remove -g \
  typescript \
  typescript-language-server \
  prettier \
  eslint \
  @tailwindcss/language-server \
  @olrtg/emmet-language-server \
  vscode-langservers-extracted
