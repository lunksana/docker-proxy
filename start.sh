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

if [ ${ENABLE_OBFS} != "Y" ]; then
/usr/local/bin/${SS_MOD} -p ${SERVER_PORT} -k ${PASSWORD} -m ${METHOD} -l 1080 -u
else
/usr/local/bin/${SS_MOD} -p ${SERVER_PORT} -k ${PASSWORD} -m ${METHOD} -l 1080 -u --plugin ${PLUGIN} --plugin-opts ${PLUGIN_OPTS}
fi