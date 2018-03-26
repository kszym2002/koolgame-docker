FROM debian:jessie

MAINTAINER Eason Summer <kszym2002@gmail.com>
ENV PD=M   \                
    PORT=7755                
 

ADD . /etc/koolgame-docker/


CMD    chmod 777 /etc/koolgame-docker/game-server  && \
   /etc/koolgame-docker/game-server -w koolshare.github.io -k $PD -p $PORT -t 600 -m chacha20-ietf 
	
