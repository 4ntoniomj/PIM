FROM alpine:3.23

# PARA QUE MUERA RÁPIDO EL CONTENEDOR
STOPSIGNAL SIGINT

# INSTALAMOS Y BORRAMOS CACHÉ
RUN apk update && apk add bind bind-tools --no-cache
RUN rm -rf /var/cache/apk/*

# COPIAMOS FICHEROS
COPY . /etc/bind
COPY ./entrypoint /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# USUARIO
RUN addgroup bind
RUN adduser -D -G bind -s /bin/ash bind
RUN chown -R bind:bind /etc/bind
RUN chown -R bind:bind /var/bind
RUN rm /etc/bind/*
USER bind
WORKDIR /etc/bind

# SCRIPT QUE CAMBIA PERMISOS EN CADA EJECUCIÓN
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
