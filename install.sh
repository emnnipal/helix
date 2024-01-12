# !/bin/bash

# install helix
# install deno as formatter
brew install \
	helix \
	deno

# install typescript language server and prettier as formatter
pnpm install -g \
	typescript \
	typescript-language-server \
	prettier
