FROM debian:jessie

MAINTAINER Eason Summer <kszym2002@gmail.com>

        
	
RUN set -ex \
    && apt-get update \
	&& apt-get install git -y \ 
    &&   cd /etc  \
    &&  git clone https://github.com/kszym2002/koolgame-docker.git \
    &&  cd koolgame-docker  \
    &&  chmod 777 game-server	\
	&&  chmod 777 start.sh
	
WORKDIR /etc/koolgame-docker

CMD /etc/koolgame-docker/start.sh
	
	
  	