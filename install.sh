# !/bin/bash

# install helix
brew install \
  helix \
  tree-sitter \
  lf

# install LSP related packages
pnpm install -g \
  typescript \
  typescript-language-server \
  prettier \
  eslint \
  @tailwindcss/language-server \
  @olrtg/emmet-language-server \
  vscode-langservers-extracted
