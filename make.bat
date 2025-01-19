@echo off
setlocal

goto :%1

:up
    if not exist config.yml (copy config.example.yml config.yml)
    docker compose up app -d
    goto :eof

:down
    docker compose down
    goto :eof

:cleanup
    docker compose down --volumes --rmi all
    goto :eof

:eof
