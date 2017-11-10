FROM debian:8.9
MAINTAINER admin <evgeniy@kolesnyk.ru>

RUN export DEBIAN_FRONTEND=noninteractive
RUN rm -f /var/lib/apt/lists/lock
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install screen curl lib32stdc++6 -y

RUN useradd -ms /bin/bash server

RUN curl -o /home/server/samp037svr_R2-1.tar.gz http://dark-games.org.ua/files/samp/samp037svr_R2-1.tar.gz
RUN cd /home/server && tar -xvzf samp037svr_R2-1.tar.gz
RUN echo "cd /home/server/samp03/" > /home/server/samp03/start.sh
RUN echo "screen -A -m -d -S samp ./samp03svr" >> /home/server/samp03/start.sh
RUN chmod +x /home/server/samp03/start.sh
RUN chmod +x /home/server/samp03/samp03svr

COPY start.sh /root/start.sh
RUN chmod +x /root/start.sh

EXPOSE 22 7777
ENTRYPOINT /root/start.sh
