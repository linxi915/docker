#!/bin/bash
# wait until MySQL is really available
max_counter=45

port=3306
host=localhost
username=root
password=

POSITIONAL=()
while [[ $# -gt 0 ]]; do
key="$1"

case ${key} in
    -p|--password)
    password="$2"
    shift # past argument
    shift # past value
    ;;
    -u|--user)
    username="$2"
    shift # past argument
    shift # past value
    ;;
    -H|--host)
    host="$2"
    shift # past argument
    shift # past value
    ;;
    -P|--port)
    port="$2"
    shift # past argument
    shift # past value
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done

set -- "${POSITIONAL[@]}" # restore positional parameters

password_arg=
if [[ -n ${password} ]]; then
    password_arg="-p${password}"
fi

counter=1
waiting_dot='.'
while ! mysql --protocol TCP -h"${host}" -P"${port}" -u"${username}" ${password_arg} -e "show databases;" > /dev/null 2>&1; do
    sleep 1
    echo "${waiting_dot}"
    waiting_dot+='.'
    counter=`expr ${counter} + 1`
    if [[ ${counter} -gt ${max_counter} ]]; then
        >&2 echo "We have been waiting for MySQL too long already; failing."
        exit 1
    fi;
done

