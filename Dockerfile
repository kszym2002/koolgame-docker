FROM debian:jessie

MAINTAINER Eason Summer <kszym2002@gmail.com>

ADD . /etc/koolgame-docker/

CMD chmod 777 /etc/koolgame-docker/game-server && \
    nohup /etc/koolgame-docker/game-server -w koolshare.github.io -c /etc/koolgame-docker/config.json &
	