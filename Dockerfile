FROM ubuntu:17.10
RUN apt-get update -y && apt-get install -y curl wget jq git
COPY install-heroku.sh setup-heroku.sh heroku-deploy.sh heroku-restart.sh ./
RUN sh ./install-heroku.sh
ENTRYPOINT ["heroku"]
