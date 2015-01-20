#!/bin/bash

########################################
## execute with "nohup sh monitor.sh" ##
## or run with crontab                ##
## Phew/NeverW8 and TheHotBot         ##
########################################


SERVICE_HOME="opt/data/log/ls/testapp"
LOG_FILE=$SERVICE_HOME/servicemix.log

ERROR_STRING=I-AM-A-ERROR

tail -Fn0 $LOG_FILE | \
while read line ; do
        echo "$line" | grep "$ERROR_STRING"
        if [ $? = 0 ]
        then
              
		/etc/init.d/APPLICATION stop && sleep 300 && /etc/init.d/APPLICATION start
		echo  $(date && echo "Restarting ")  >> restartdate.log
		echo  "-----------"  >> restartdate.log
        fi
done