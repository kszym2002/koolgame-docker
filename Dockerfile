FROM debian:jessie

MAINTAINER Eason Summer <kszym2002@gmail.com>
ENV PD=M                   \
    PORT=7755                   \
    OPEN=TRUE

ADD . /etc/koolgame-docker/

CMD sed -i "s|\"password\": false|\"password\": \"${PD}\"|"                              /etc/koolgame-docker/config.json && \
    sed -i "s|\"server_port\": false|\"server_port\": ${PORT}|"                       /etc/koolgame-docker/config.json  && \
    sed -i "s|\"fast_open\": false|\"fast_open\": ${OPEN}|"                        /etc/koolgame-docker/config.json  && \
    chmod 777 /etc/koolgame-docker/game-server && \
    /etc/koolgame-docker/game-server -w koolshare.github.io -c /etc/koolgame-docker/config.json 
	
