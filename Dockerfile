FROM debian:jessie

MAINTAINER Eason Summer <kszym2002@gmail.com>

ENV server_port=8080             \
    password=m                   \
    timeout=600                     \
    method=chacha20-ietf          \
    fast_open=true                
	
RUN apt-get update && apt-get install git -y
RUN cd /etc 
RUN git clone https://github.com/kszym2002/koolgame-docker.git
RUN cd koolgame-docker
RUN chmod 777 game-server  

CMD sed -i "s|\"server_port\": \"8080\"|\"server_port\": \"${server_port}\"|"               /root/koolgame-docker/config.json && \
    sed -i "s|\"password\": \"m\"|\"password\": \"${password}\"|"               /root/koolgame-docker/config.json && \
	sed -i "s|\"timeout\": 600|\"timeout\": ${timeout}|"               /root/koolgame-docker/config.json && \
	sed -i "s|\"method\": chacha20-ietf|\"method\": ${method}|"               /root/koolgame-docker/config.json && \
	sed -i "s|\"fast_open\": true|\"fast_open\": ${fast_open}|"               /root/koolgame-docker/config.json && \
	./game-server -w koolshare.github.io -c config.json > z.log 2>&1 &
	
	
  	