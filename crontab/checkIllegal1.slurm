#!/bin/bash

# Let no files expand to a null string
shopt -s nullglob

# Go to the Appusage directory
cd /cluster/software/appusage/1.0

# Sort .illegal files and store them in appusage_log1
today=`date | cut -c5-10`
rm -f crontab/appusage_log1/*
for f in log/*.illegal
do
  # ignore compute nodes that are down, version 1
  lsout=`ls -l $f | grep "$today"`
  if [ "$lsout" != "" ]; then

    # ignore compute nodes that are down, version 2
    name=`basename $f`
    node=`echo $name | cut -d'.' -f1`
    nodeinfo=`sinfo -N | grep "$node " | tr '\n' ' '`
    if [ -n "$nodeinfo" ]; then

      # ignore compute nodes that are down, version 3
      down=`echo "$nodeinfo" | egrep 'down|drain|resv' | tr -d '[:space:]'`
      if [ -z "$down" ]; then
        sort $f > crontab/appusage_log1/$name
      fi
    fi
  fi
done
