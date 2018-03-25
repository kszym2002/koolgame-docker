FROM debian:jessie

MAINTAINER Eason Summer <kszym2002@gmail.com>

ENV server_port=8080             \
    password=m                   \
    timeout=1                     \
    method=chacha20-ietf          \
    fast_open=true                \
	

CMD sed -i "s|\"server_port\": \"8080\"|\"server_port\": \"${server_port}\"|"               /root/config.json && \
    sed -i "s|\"password\": \"m\"|\"password\": \"${password}\"|"               /root/config.json && \
	sed -i "s|\"timeout\": 600|\"timeout\": ${timeout}|"               /root/config.json && \
	sed -i "s|\"method\": chacha20-ietf|\"method\": ${method}|"               /root/config.json && \
	sed -i "s|\"fast_open\": true|\"fast_open\": ${fast_open}|"               /root/config.json && \
	nohup ./root/game-server -w koolshare.github.io -c /root/config.json > /root/z.log 2>&1 &