FROM ubuntu:17.10
RUN apt-get update -y && apt-get install -y curl wget jq git
COPY install-heroku.sh .
RUN sh ./install-heroku.sh
ENTRYPOINT ["heroku"]
