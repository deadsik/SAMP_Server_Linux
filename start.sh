#!/bin/bash
for i in `screen -ls |grep 'samp' |awk '{print $1}'` ;  do screen -X -S $i quit ; done
screen -A -m -d -S samp sudo -H -u server bash -c 'cd /home/server/samp03  && /home/server/samp03/samp03svr'
