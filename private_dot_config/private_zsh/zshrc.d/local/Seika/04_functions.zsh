function compose-file {
      if [[ "$1" == "new" ]] then
        line=$(rg -n "^volumes:" $COMPOSE_FILE | head -n 1 | cut -d ":" -f 1)
        (( line -= 1 ))
        $EDITOR $COMPOSE_FILE +${line}:3
      elif [[ -n "$1" ]] then
        line=$(rg -n "  $1:" $COMPOSE_FILE | head -n 1 | cut -d ":" -f 1)

        if [[ -n "$line" ]] then
          $EDITOR $COMPOSE_FILE +${line}
        else
          echo "No service named \"$1\""
        fi

      else
        $EDITOR $COMPOSE_FILE
      fi
}

function show-caddyfile {
      if [[ $1 == "json" ]] then
        docker exec caddy cat /config/caddy/autosave.json | rich --json -
      else
        docker exec caddy cat /config/caddy/Caddyfile.autosave
      fi
}

function compose-env {
      if [[ -z $1 ]] then
              $EDITOR ${CONFIG_DIR}/.env
      else
              (cd ${CONFIG_DIR}; npx dotenv-vault@latest $@)
      fi
}
