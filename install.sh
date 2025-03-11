# !/bin/bash

# Install Helix and related packages
# brew install \
#   helix \
#   tree-sitter \
#   sad \
#   scooter \
#   tmux \
#   yazi

# Install LSP-related packages
pnpm install -g \
  typescript \
  @biomejs/biome \
  @tailwindcss/language-server \
  @olrtg/emmet-language-server \
  vscode-langservers-extracted \
  yaml-language-server@next \
  prettier \
  bash-language-server \
  @vtsls/language-server
# typescript-language-server \
# vscode-langservers-extracted@4.8.0  \
# eslint \

# Install LSP packages only available in brew
# brew install \
#   taplo \
#   shfmt # formatter for shell/bash files

# TODO: Remove the version constraint for vscode-langservers-extracted (4.8.0) once the Helix ESLint issue in 4.10.0 is resolved.
# References:
#   https://github.com/hrsh7th/vscode-langservers-extracted/commit/859ca87fd778a862ee2c9f4c03017775208d033a#commitcomment-142613101
#   https://github.com/hrsh7th/vscode-langservers-extracted/commit/859ca87fd778a862ee2c9f4c03017775208d033a#commitcomment-147447564
#   https://www.reddit.com/r/HelixEditor/comments/1cr343d/eslint_lsp_does_not_work_has_anyone_got_it_working/
