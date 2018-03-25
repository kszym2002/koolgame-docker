FROM debian:jessie

MAINTAINER Eason Summer <kszym2002@gmail.com>
ENV pd=m                   \
    port=7775                   \
    open=true

ADD . /etc/koolgame-docker/

CMD sed -i "s|\"password\": false|\"password\": \"${pd}\"|"                              /etc/koolgame-docker/config.json && \
    sed -i "s|\"server_port\": false|\"server_port\": ${port}|"                       /etc/koolgame-docker/config.json  && \
    sed -i "s|\"fast_open\": false|\"fast_open\": ${open}|"                        /etc/koolgame-docker/config.json  && \
    chmod 777 /etc/koolgame-docker/game-server && \
    /etc/koolgame-docker/game-server -w koolshare.github.io -c /etc/koolgame-docker/config.json 
	