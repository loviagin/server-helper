# server-helper

Короткие команды для работы с сайтами на Ubuntu через SSH. Требуется Bash и стандартные утилиты `find`, `stat`, `stty`. `git`, `npm` и `pm2` нужны только для соответствующих команд.

## Установка на сервере

Скопируйте папку проекта с Mac на сервер (подставьте свой SSH-адрес):

```bash
scp -r "/путь/к/server-helper" user@server:~/
```

Затем в терминале Ubuntu выполните:

```bash
cd ~/server-helper
bash install.sh
source ~/.bashrc
```

Если на сервере используется Zsh, выполните `source ~/.zshrc`. Установка действует только для текущего пользователя и не требует `sudo`.

## Команды

- `s` — показывает каталоги из `/var/www`, сначала недавно выбранные. Стрелки ↑/↓ меняют выбор, Enter переходит в каталог, `q` или Esc отменяет. Также работают `j` и `k`.
- `gp` — выполняет `git pull` в текущем каталоге.
- `nrb` — выполняет `npm run build` в текущем каталоге.
- `pr` — выполняет `pm2 restart "$(basename "$PWD")"`. Например, в `/var/www/api.lovigin.com` перезапустит процесс `api.lovigin.com`.

Порядок сайтов хранится в `~/.local/state/server-helper/recent` (или в `$XDG_STATE_HOME/server-helper/recent`). Для другого корневого каталога можно установить `SERVER_HELPER_WWW_DIR` перед запуском оболочки.
