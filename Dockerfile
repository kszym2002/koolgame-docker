FROM debian:jessie

MAINTAINER Eason Summer <kszym2002@gmail.com>

ENV server_port=8080             \
    password=m                   \
    timeout=1                     \
    method=chacha20-ietf          \
    fast_open=true                
	
RUN cd /root && git clone https://github.com/kszym2002/koolgame-docker.git  && \
    cd koolgame-docker / && 

CMD sed -i "s|\"server_port\": \"8080\"|\"server_port\": \"${server_port}\"|"               /root/koolgame-docker/config.json && \
    sed -i "s|\"password\": \"m\"|\"password\": \"${password}\"|"               /root/koolgame-docker/config.json && \
	sed -i "s|\"timeout\": 600|\"timeout\": ${timeout}|"               /root/koolgame-docker/config.json && \
	sed -i "s|\"method\": chacha20-ietf|\"method\": ${method}|"               /root/koolgame-docker/config.json && \
	sed -i "s|\"fast_open\": true|\"fast_open\": ${fast_open}|"               /root/koolgame-docker/config.json && \
	./root/koolgame-docker/game-server -w koolshare.github.io -c /root/koolgame-docker/config.json > /root/koolgame-docker/z.log 2>&1 &