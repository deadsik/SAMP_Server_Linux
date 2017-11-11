#!/bin/bash
PASSWORD=`< /dev/urandom tr -dc A-Z-a-z-0-9 | head -c6`
HOSTNAME="DARK-GAMES.ORG.UA"
FILE="/home/server/samp03/server.cfg"
sed -i 's/.*rcon_password.*/rcon_password '$PASSWORD'/' $FILE
sed -i 's/.*hostname.*/hostname '$HOSTNAME'/' $FILE
sed -i '/update.sh/d' /root/restart_all.sh
rm -f /root/update.sh
