# server-helper

Короткие команды для работы с сайтами на Ubuntu через SSH. Требуется Bash и стандартные утилиты `find`, `stat`, `stty`. `git`, `npm` и `pm2` нужны только для соответствующих команд.

## Установка на сервере

На сервере клонируйте репозиторий и запустите установщик:

```bash
git clone https://github.com/loviagin/server-helper.git ~/server-helper
cd ~/server-helper
bash install.sh
source ~/.bashrc
```

Если на сервере используется Zsh, выполните `source ~/.zshrc`. Установка действует только для текущего пользователя и не требует `sudo`.

Для обновления выполните `cd ~/server-helper && git pull && bash install.sh`, затем переподключитесь по SSH или снова загрузите конфигурацию оболочки.

## Команды

- `s` — показывает каталоги из `/var/www`, сначала недавно выбранные. Стрелки ↑/↓ меняют выбор, Enter переходит в каталог, `q` или Esc отменяет. Также работают `j` и `k`.
- `gp` — выполняет `git pull` в текущем каталоге.
- `nrb` — выполняет `npm run build` в текущем каталоге.
- `pr` — выполняет `pm2 restart "$(basename "$PWD")"`. Например, в `/var/www/api.lovigin.com` перезапустит процесс `api.lovigin.com`.

Порядок сайтов хранится в `~/.local/state/server-helper/recent` (или в `$XDG_STATE_HOME/server-helper/recent`). Для другого корневого каталога можно установить `SERVER_HELPER_WWW_DIR` перед запуском оболочки.
