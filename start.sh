#!/bin/sh

#SS_CONFIG=${SS_CONFIG:-""}
#SS_MODULE=${SS_MODULE:-"ss-server"}
#
#while getopts "s:m" OPT; do
#    case $OPT in
#        s)
#            SS_CONFIG=$OPTARG;;
#        m)
#            SS_MODULE=$OPTARG;;
#    esac
#done
#
#if [ "$SS_CONFIG" != "" ]; then
#    echo -e "\033[32mStarting shadowsocks......\033[0m"
#    $SS_MODULE $SS_CONFIG
#else
#    echo -e "\033[31mError: SS_CONFIG is blank!\033[0m"
#    exit 1
#fi

if [ ${SS_MOD} == "ss-server"]; then
    if [ ${ENABLE_OBFS} != 'true' ]; then
        ${SS_MOD} -p ${SERVER_PORT} -k ${PASSWORD} -m ${METHOD} -l ${LOCAL_PORT} -u
    else
        ${SS_MOD} -p ${SERVER_PORT} -k ${PASSWORD} -m ${METHOD} -l ${LOCAL_PORT} -u --plugin ${PLUGIN} --plugin-opts ${PLUGIN_OPTS}
    fi
else
    if [ ${ENABLE_OBFS} != 'true' ]; then
        ${SS_MOD} -s ${SERVER_HOST} -p ${SERVER_PORT} -k ${PASSWORD} -m ${METHOD} -l ${LOCAL_PORT} -u
    else
        ${SS_MOD} -s ${SERVER_HOST} -p ${SERVER_PORT} -k ${PASSWORD} -m ${METHOD} -l ${LOCAL_PORT} -u --plugin ${PLUGIN} --plugin-opts ${PLUGIN_OPTS}
    fi
fi