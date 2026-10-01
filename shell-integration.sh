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

acp() {
  if [[ $# -ne 2 || $1 != -m || -z $2 ]]; then
    printf 'Usage: acp -m "comment"\n' >&2
    return 2
  fi
  command git add . && command git commit -m "$2" && command git push
}

nrb() {
  command npm run build "$@"
}

ni() {
  command npm install "$@"
}

pr() {
  local process_name=${PWD%/}
  process_name=${process_name##*/}
  command pm2 restart "$process_name" "$@"
}

pibr() {
  gp || return
  ni || return
  nrb || return
  pr
}

u() {
  "$HOME/.local/bin/server-helper" update || return
  . "$HOME/.local/share/server-helper/shell-integration.sh"
}
