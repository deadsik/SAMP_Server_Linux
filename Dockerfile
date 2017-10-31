FROM debian:8.9
MAINTAINER admin <evgeniy@kolesnyk.ru>

RUN export DEBIAN_FRONTEND=noninteractive
RUN rm -f /var/lib/apt/lists/lock
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install screen curl lib32stdc++6 -y
RUN curl -o /root/samp037svr_R2-1.tar.gz http://dark-games.org.ua/files/samp/samp037svr_R2-1.tar.gz
RUN cd /root && tar -xvzf samp037svr_R2-1.tar.gz
RUN echo "cd /root/samp03/" >> /root/samp03/start.sh
RUN echo "/root/samp03/samp03svr" > /root/samp03/start.sh
RUN chmod +x /root/samp03/start.sh
RUN chmod +x /root/samp03/samp03svr

COPY start.sh /root/start.sh
RUN chmod +x /root/start.sh

EXPOSE 22 27015
ENTRYPOINT /root/start.sh
