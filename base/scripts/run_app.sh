#!/bin/bash
HOST_FILE=$CONFIG_DIR/hosts.conf
#start mongod process
mongod --fork  --logpath $LOG_FILE --replSet $REPLICA_NAME
#check if config file exists
sleep 5
if [ ! -e  $HOST_FILE ] || [ ! -s $HOST_FILE ];then
    touch $HOST_FILE
    mongo --host $HOSTNAME --eval "rs.initiate()"
else
    for host in $(cat $HOST_FILE);
        do
           isMaster=$(mongo --host $host --eval "db.isMaster()"| grep 'ismaster' | awk '{print $NF}' | sed  s'/.$//')
           if [ $isMaster == 'true' ];then
                count=0
                while [ $(mongo --host $host --eval "rs.add('$HOSTNAME')"|grep 'ok'| awk '{print $NF}' | sed  s'/.$//') == '0' ]
                do
                    sleep 3
                    echo $count
                    if [ $count -eq 5 ];then
                        break;
                    fi
                    count=`expr $count + 1`
                done
                break;
           fi
        done
fi
#append hostname to file
 echo $HOSTNAME >> $HOST_FILE
tail -f -n0 $LOG_FILE