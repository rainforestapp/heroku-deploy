#!/usr/bin/env bash

set -euo pipefail

source /scripts/setup.sh

APP_NAME="${1:-}"
SLEEP="${2:-}"

if [[ -z $APP_NAME ]]; then
  echo "Usage: $0 <env>"
  exit 1
fi

git push -f "git@heroku.com:$APP_NAME.git" "$CIRCLE_SHA1:master"

if [[ -z ${HEROKU_SKIP_ECTO_MIGRATE:=""} ]]; then
  heroku run mix ecto.migrate --app "$APP_NAME" --exit-code
else
  echo "skipping 'ecto:migrate' with HEROKU_SKIP_DB_MIGRATE..."
fi

source /scripts/restart.sh "$APP_NAME" "$SLEEP"
