FROM alpine:3.23

# ELIMINAMOS CONFIGURACIÓN Y COPIAMOS ARCHIVOS NECESARIOS
RUN rm /etc/vsftpd/vsftpd.conf 
COPY ./cp/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./cp/entrypoint.sh /usr/local/bin/entrypoint.sh

# Instalación sin cache
RUN apk update && apk add --no-cache vsftpd db libc6-compat

# USUARIO
RUN addgroup core
RUN adduser -D -G core -s /bin/ash core
RUN chown -R core:core /etc/bind
RUN chown -R core:core /var/core
WORKDIR /etc/vsftpd

# VARIABLES DE CONFIGURACIÓN
ENV LOCAL_USER=no12
ENV LOCAL_PASSWORD=
ENV VIRTUAL_USER=no12
ENV VIRTUAL_PASSWORD=

# SCRIPT QUE CAMBIA PERMISOS EN CADA EJECUCIÓN
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
