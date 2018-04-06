#!/usr/bin/env bash

set -euo pipefail

if [ -f ~/.netrc ] && grep -qx "machine api.heroku.com" ~/.netrc ; then
  exit 0
fi

cat > ~/.netrc << EOF
machine api.heroku.com
  login $HEROKU_LOGIN
  password $HEROKU_API_KEY
EOF

cat >> ~/.ssh/config << EOF
VerifyHostKeyDNS yes
StrictHostKeyChecking no
EOF
