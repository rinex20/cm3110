!#/bin/bash

STR2STR_PATH=/usr/local/bin/str2str
OPT_FILE=/etc/default/gateway
DAEMON_FILE=/etc/systemd/system/gateway-daemon.service

if [ -f $STR2STR_PATH ]
then 
  echo "$STR2STR_PATH exists."
else
  cp bin/str2str /usr/local/bin/
  chmod +x $STR2STR_PATH
fi

if [ -f $OPT_FILE ]
then
  echo "$OPT_FILE exists."
else
  cp bin/gateway /etc/default/
fi

if [ -f $DAEMON_FILE ]
then
  echo "$DAEMON_FILE exists."
else
  cp bin/gateway-daemon.service /etc/systemd/system/
  systemctl daemon-reload
  systemctl enable gateway-daemon.service
  systemctl start gateway-daemon.service
  systemctl status gateway-daemon.service
fi

echo "Install Finished."
