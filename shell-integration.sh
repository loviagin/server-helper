# Source this file from ~/.bashrc or ~/.zshrc.
_server_helper_bin="$HOME/.local/bin/server-helper"

s() {
  local site
  site="$("$_server_helper_bin" select)" || return
  builtin cd -- "$site" || return
  "$_server_helper_bin" mark "$site"
}

gp() {
  command git pull "$@"
}

nrb() {
  command npm run build "$@"
}

pr() {
  local process_name=${PWD%/}
  process_name=${process_name##*/}
  command pm2 restart "$process_name" "$@"
}
