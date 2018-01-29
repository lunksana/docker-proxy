#!/bin/sh

if [ ${SS_MOD} == "ss-server"]; then
    if [ ${ENABLE_OBFS} != 'true' ]; then
        ${SS_MOD} -p ${SERVER_PORT} -k ${PASSWORD} -m ${METHOD} -l 1080 -u
    else
        ${SS_MOD} -p ${SERVER_PORT} -k ${PASSWORD} -m ${METHOD} -l 1080 -u --plugin ${PLUGIN} --plugin-opts ${PLUGIN_OPTS}
    fi
else
    if [ ${ENABLE_OBFS} != 'true' ]; then
        ${SS_MOD} -s ${SERVER_HOST} -p ${SERVER_PORT} -k ${PASSWORD} -m ${METHOD} -l 1080 -u
    else
        ${SS_MOD} -s ${SERVER_HOST} -p ${SERVER_PORT} -k ${PASSWORD} -m ${METHOD} -l 1080 -u --plugin obfs-local --plugin-opts ${PLUGIN_OPTS_LOCAL}
    fi
fi