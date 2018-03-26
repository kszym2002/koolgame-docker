FROM debian:jessie

MAINTAINER Eason Summer <kszym2002@gmail.com>
ENV PD=M                   
ENV PORT=7755                   
ENV OPEN=TRUE

ADD . /etc/koolgame-docker/

CMD    sed -i "s|\"password\": false|\"password\": \"${PD}\"|"    /etc/koolgame-docker/config.json 
CMD    sed -i "s|\"server_port\": false|\"server_port\": ${PORT}|"  /etc/koolgame-docker/config.json  
CMD    sed -i "s|\"fast_open\": false|\"fast_open\": ${OPEN}|"   /etc/koolgame-docker/config.json  
CMD    chmod 777 /etc/koolgame-docker/game-server 
CMD    /etc/koolgame-docker/game-server -w koolshare.github.io -c /etc/koolgame-docker/config.json 
	
