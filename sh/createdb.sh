#!/bin/bash
set -eu

su -p oracle -c "sqlplus / as sysdba" <<EOS
shutdown immediate
quit
EOS

su -p oracle -c "$ORACLE_HOME/bin/createdb.sh -shiploc -dbchar JA16SJISTILDE"
