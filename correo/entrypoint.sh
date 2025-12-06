#!/bin/ash

sed -i 's/mail_owner = postfix/mail_owner = ${USER}/' /etc/postfix/main.cf


if [[ ${TLS} == "yes" ]]; then
	postconf -e 'smtpd_tls_cert_file='${TLSCERT}
	postconf -e 'smtpd_tls_key_file='${TLSKEY}
	postconf -e 'smtpd_use_tls = yes'
	postconf -e 'smtp_tls_CApath='${CACERT}

fi
#postconf -e ‘smtpd_tls_security_level=may’

#postconf -e ‘smtp_tls_security_level=may’
#postconf -e ‘smtp_tls_session_cache_database = btree:${data_directory}/smtp_scache’

#postconf -e ‘smtpd_tls_auth_only = no’
#postconf -e ‘smtp_tls_note_starttls_offer = yes’
#postconf -e ‘smtpd_tls_loglevel = 1’
#postconf -e ‘smtpd_tls_received_header = yes’
#postconf -e ‘smtpd_tls_session_cache_timeout = 3600’
#postconf -e ‘tls_random_source = dev:/dev/urandom’
