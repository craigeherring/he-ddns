#!/bin/bash
#############
#
# ddns
#
# Run dynamic dns updater every 5 minutes
# use cron to facilitate
# */5 * * * * root /root/ddns
#
# script will update to the public IP the
# script originates from
#
#############
DDNSNAME="www.vmuglabs.net"
KEYPASS="VV2T9X1NihmpIYag"
TMPFILE=/tmp/ddnstmp
LOGFILE=/var/log/ddns

# use curl
curl -k -o $TMPFILE "https://dyn.dns.he.net/nic/update" -d "hostname=$DDNSNAME" -d "password=$KEYPASS"


# log so we know what it did and when
echo `date` >> $LOGFILE
echo $DDNSNAME >> $LOGFILE
cat $TMPFILE >> $LOGFILE
echo "" >> $LOGFILE

