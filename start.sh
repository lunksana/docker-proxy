#!/bin/sh

if [ ${SS_MOD} == "ss-server" ]; then
    if [ ${ENABLE_OBFS} != 'true' ]; then
        ${SS_MOD} -p 10000 -k ${PASSWORD} -m ${METHOD} -u
    else
        ${SS_MOD} -p 10000 -k ${PASSWORD} -m ${METHOD} -u --plugin ${PLUGIN} --plugin-opts ${PLUGIN_OPTS}
    fi
else
    if [ ${ENABLE_OBFS} != 'true' ]; then
        ${SS_MOD} -s ${SERVER_HOST} -p ${SERVER_PORT} -k ${PASSWORD} -m ${METHOD} -b 0.0.0.0 -l 10000 -u
    else
        ${SS_MOD} -s ${SERVER_HOST} -p ${SERVER_PORT} -k ${PASSWORD} -m ${METHOD} -b 0.0.0.0 -l 10000 -u --plugin obfs-local --plugin-opts ${PLUGIN_OPTS_LOCAL}
    fi
fi
#mod=('ss-server' 'ss-local' 'ss-tunnel')
