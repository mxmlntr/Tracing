#!/bin/bash

#This script collects all context changes done over 273 iterationsm of measurements

rm context_changes.txt

/usr/bin/time -v bash ContextChangesDaemonDummy250kBNewfile.sh 2>> context_changes.txt
