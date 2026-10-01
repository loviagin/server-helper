#!/usr/bin/env bash
set -euo pipefail

source_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
bin_dir="$HOME/.local/bin"
share_dir="$HOME/.local/share/server-helper"
source_line='[ -f "$HOME/.local/share/server-helper/shell-integration.sh" ] && . "$HOME/.local/share/server-helper/shell-integration.sh"'

mkdir -p -- "$bin_dir" "$share_dir"
install -m 755 -- "$source_dir/server-helper" "$bin_dir/server-helper"
install -m 644 -- "$source_dir/shell-integration.sh" "$share_dir/shell-integration.sh"
printf '%s\n' "$source_dir" > "$share_dir/source-path"

for rc in "$HOME/.bashrc" "$HOME/.zshrc"; do
  if [[ ! -f $rc ]] || ! grep -Fqx -- "$source_line" "$rc"; then
    printf '\n# server-helper\n%s\n' "$source_line" >> "$rc"
  fi
done

printf 'Installed. Open a new terminal, or run:\n  source ~/.bashrc  # Bash\n  source ~/.zshrc   # Zsh\n'
