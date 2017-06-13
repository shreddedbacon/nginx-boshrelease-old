#!/bin/bash -e

JOB_NAME=php-fpm
BASE_DIR=/var/vcap
SYS_DIR=$BASE_DIR/sys
RUN_DIR=$SYS_DIR/run/php
LOG_DIR=$SYS_DIR/log/php
JOB_DIR=$BASE_DIR/jobs/php
CONFIG_DIR=$JOB_DIR/etc
CONFIG_FILE=$CONFIG_DIR/php-fpm.conf
PERSISTENT=$BASE_DIR/store
PIDFILE=$RUN_DIR/$JOB_NAME.pid

mkdir -p $RUN_DIR $LOG_DIR $CONFIG_DIR

case $1 in

  start)
    $BASE_DIR/packages/php/sbin/$JOB_NAME -g $PIDFILE -y $CONFIG_FILE
    ;;
  stop)
    kill $(cat $PIDFILE)
    ;;
  *)
    echo "Usage: ctl {start|stop}"
    ;;
esac
