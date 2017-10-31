#!/bin/bash
for i in `screen -ls |grep 'samp' |awk '{print $1}'` ;  do screen -X -S $i quit ; done
/root/samp03/start.sh
