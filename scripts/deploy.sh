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
heroku run rake db:migrate --app "$APP_NAME" --exit-code
source /scripts/restart.sh "$APP_NAME" "$SLEEP"
