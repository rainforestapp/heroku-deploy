#!/usr/bin/env bash

set -euo pipefail

APP_NAME="$1"
SLEEP="${2:-0}"

if [[ -z $APP_NAME ]]; then
  echo "Usage: $0 <env> [delay]"
  exit 1
fi

./setup-heroku.sh

for i in {1..5}; do
    echo "Try #$i"
    echo "Waiting ${SLEEP} seconds..."
    sleep "$SLEEP"
    if heroku restart -a "$APP_NAME"; then
        break
    fi
    sleep 5
done
