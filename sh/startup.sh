#!/bin/bash

/etc/init.d/oracle-xe restart
tail -f $ORACLE_BASE/diag/rdbms/*/*/trace/alert*.log &
childPID=$!
wait $childPID
