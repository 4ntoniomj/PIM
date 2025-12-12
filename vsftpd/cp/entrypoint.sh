#!/bin/ash

if [[ ${LOCAL_USER} != "no12" ]]; then
    mkdir -p /home/${i}
    addgroup $i
    adduser -D -G $i -s /bin/ash core
fi

if [[ ${VIRTUAL_USER} != "no12" ]]; then
    contador=1
    touch /etc/vsftpd/login.txt
    chmod 600 /etc/vsftpd/login.txt
    for i in ${LOCAL_USER}; do
        echo $i >> /etc/vsftpd/login.txt
        echo ${VIRTUAL_PASSWORD[$contador]} >> /etc/vsftpd/login.txt
        contador=$((contador + 1))
    done
    db_load -T -t hash -f /etc/vsftpd/virtual_users.txt /etc/vsftpd/virtual_users.db
    chmod 600 /etc/vsftpd/virtual_users.db
    rm /etc/vsftpd/login.txt

fi