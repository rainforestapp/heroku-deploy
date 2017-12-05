FROM ubuntu:17.10
RUN apt-get update -y && apt-get install -y curl wget jq
RUN curl -s https://cli-assets.heroku.com/install-ubuntu.sh | sh
ENTRYPOINT ["heroku"]
