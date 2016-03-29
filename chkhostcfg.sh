#!/bin/bash
#
# set -x

HOST=$1
MONITORING_CONFIG_PROD=./analysis.cfg
MONITORING_CONFIG_NONPROD=./hobbit-clients.cfg

trap Abort INT TERM

Abort()
{
	exit 0
}

Usage()
{
	echo "checkhost.sh [hostname]"
	Abort
}

if [[ -z $HOST ]]
then
	Usage
fi

#if [ ! -f "$MONITORING_CONFIG" ]
#then
#	if [[ $MONITORING_CONFIG == analysis.cfg ]]
#	then
#		scp -q lp-webhobbit01:/usr/local/xymon/server/etc/analysis.cfg .
#	fi
#
#	if [[ $MONITORING_CONFIG == hobbit-clients.cfg ]]
#	then
#		scp -q webhobbit-dev:/usr/local/hobbit/server/etc/hobbit-clients.cfg .
#	fi
#fi

echo "$HOST from $MONITORING_CONFIG_PROD using sed:"
sed -n "/HOST=$HOST/,/^$/p" ./$MONITORING_CONFIG_PROD
echo ""
echo "$HOST from $MONITORING_CONFIG_PROD using grep:"
grep $HOST ./$MONITORING_CONFIG_PROD
echo ""
echo "$HOST from $MONITORING_CONFIG_NONPROD using sed:"
sed -n "/HOST=$HOST/,/^$/p" ./$MONITORING_CONFIG_NONPROD
echo ""
echo "$HOST from $MONITORING_CONFIG_NONPROD using grep:"
grep $HOST ./$MONITORING_CONFIG_NONPROD
echo ""
