#!/bin/bash
# wait until MySQL is really available
max_counter=45

port=3306
host=localhost
username=root
password=

cmd="$@"

if [[ -n "${MYSQL_PORT}" ]]; then
    port="${MYSQL_PORT}"
fi
if [[ -n "${MYSQL_HOST}" ]]; then
    host="${MYSQL_HOST}"
fi
if [[ -n "${MYSQL_USER}" ]]; then
    username="${MYSQL_USER}"
fi
if [[ -n "${MYSQL_PASSWORD}" ]]; then
    password="${MYSQL_PASSWORD}"
fi

password_arg=
if [[ -n ${password} ]]; then
    password_arg="-p${password}"
fi

counter=1
waiting_dot='.'
while ! mysql --protocol TCP -h"${host}" -P"${port}" -u"${username}" ${password_arg} -e "show databases;" > /dev/null 2>&1; do
    sleep 1
    ehco "${waiting_dot}"
    waiting_dot+='.'
    counter=`expr ${counter} + 1`
    if [[ ${counter} -gt ${max_counter} ]]; then
        >&2 echo "We have been waiting for MySQL too long already; failing."
        exit 1
    fi;
done

echo "MySQL is up - executing command"
exec ${cmd}

