# !/bin/bash

# install helix
# install deno as formatter
brew install \
	helix \
	lf \

# install typescript language server and prettier as formatter
pnpm install -g \
	typescript \
	typescript-language-server \
	prettier \
	@tailwindcss/language-server \
	@olrtg/emmet-language-server \
  vscode-langservers-extracted \
