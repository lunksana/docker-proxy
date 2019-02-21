#!/bin/sh

#if [ ${SS_MOD} == "ss-server" ]; then
#    if [ ${ENABLE_OBFS} != 'true' ]; then
#        ${SS_MOD} -p 10000 -k ${PASSWORD} -m ${METHOD} -u
#    else
#        ${SS_MOD} -p 10000 -k ${PASSWORD} -m ${METHOD} -u --plugin ${PLUGIN} --plugin-opts ${PLUGIN_OPTS}
#    fi
#else
#    if [ ${ENABLE_OBFS} != 'true' ]; then
#        ${SS_MOD} -s ${SERVER_HOST} -p ${SERVER_PORT} -k ${PASSWORD} -m ${METHOD} -b 0.0.0.0 -l 10000 -u
#    else
#        ${SS_MOD} -s ${SERVER_HOST} -p ${SERVER_PORT} -k ${PASSWORD} -m ${METHOD} -b 0.0.0.0 -l 10000 -u --plugin obfs-local --plugin-opts ${PLUGIN_OPTS_LOCAL}
#    fi
#fi
case ${SS_MOD} in
    ss-server) MOD='server';SERVER_HOST=10000
    ;;
    ss-local|ss-tunnel) LOCAL_PORT=10000; MOD='client'
    ;;
    *) echo "ERROR,Mode does not exist!";exit 1
esac

if [ $MOD == 'server' ]; then
    if [ ${ENABLE_OBFS} != 'true' ]; then
        EXTEND="-u"
    else
        EXTEND="--plugin ${PLUGIN} --plugin-opts ${PLUGIN_OPTS} -u"
    fi
else
    if [ ${ENABLE_OBFS} != 'true' ]; then
        EXTEND="-s ${SERVER_HOST} -b 0.0.0.0 -l 10000 -u"
    else
        EXTEND="-s ${SERVER_HOST} -b 0.0.0.0 -l 10000 --plugin ${PLUGIN} --plugin-opts ${PLUGIN_OPTS_LOCAL} -u"
    fi
fi

${SS_MOD} -k ${PASSWORD} -p ${SERVER_PORT} -m ${METHOD} ${EXTEND}