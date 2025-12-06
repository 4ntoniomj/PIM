FROM alpine:3.23

# PARA QUE MUERA RÁPIDO EL CONTENEDOR
STOPSIGNAL SIGINT

# INSTALAMOS Y BORRAMOS CACHÉ
RUN apk update && apk add postfix postfix-ldap postfix-doc --no-cache
RUN rm -rf /var/cache/apk/*

# VARIABLES
ENV USER=mail
ENV FQDN=mail.bodyskills.local
ENV DOMAIN=bodyskills.local
ENV TLSCERT=/etc/postfix/certs/mail.crt
ENV TLSKEY=/etc/postfix/private/mail.key
ENV CACERT=/etc/postfix/certs/ca.crt
ENV TLS=yes

# USUARIO
RUN addgroup ${USER}
RUN adduser -D -G ${USER} -s /bin/ash ${USER}
RUN chown -R ${USER}:${USER} /etc/postfix
USER ${USER}
WORKDIR /etc/postfix

# SCRIPT QUE CAMBIA PERMISOS EN CADA EJECUCIÓN
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

