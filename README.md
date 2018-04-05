# heroku-deploy

A Dockerfile that we use to deploy stuff to Heroku with.

### Configuration

1. Expose heroku credentials to the container via: `HEROKU_LOGIN` and `HEROKU_API_KEY` variables (set in CircleCI's UI or `config.yml`)
2. Execute `setup-heroku.sh` that stores the credentials in `~/.netrc` before calling any script.
