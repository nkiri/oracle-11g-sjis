FROM oracle/database:11.2.0.2-xe

ARG oracle_pwd
ENV ORACLE_PWD ${oracle_pwd:-oracle}

ADD sh/ /usr/local/sbin/

RUN sed -i -e 's/%hostname%/0.0.0.0/g' $ORACLE_HOME/network/admin/tnsnames.ora && \
    sed -i -e 's/%hostname%/0.0.0.0/g' $ORACLE_HOME/network/admin/listener.ora && \
    sed -i -e "s/###ORACLE_PWD###/$ORACLE_PWD/g" $ORACLE_BASE/$CONFIG_RSP && \
    /etc/init.d/oracle-xe configure responseFile=$ORACLE_BASE/$CONFIG_RSP && \
    /usr/local/sbin/createdb.sh

CMD ["/usr/local/sbin/startup.sh"]
