FROM debian:jessie

MAINTAINER Eason Summer <kszym2002@gmail.com>

ENV server_port=8080             \
    password=m                   \
    timeout=600                     \
    method=chacha20-ietf          \
    fast_open=true                
	
RUN apt-get update && apt-get install git -y && \
    cd /etc  && \
    git clone https://github.com/kszym2002/koolgame-docker.git && \
    cd koolgame-docker    && \
    chmod 777 game-server	
	
WORKDIR /etc/koolgame-docker

CMD /etc/koolgame-docker/start.sh
	
	
  	