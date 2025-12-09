# IMAGEN DE ALPINE, VERSIÓN DEFINIDA PARA EVITAR CAMBIOS
FROM alpine:3.23

# ACTUALIZAMOS E INSTALAMOS NGINX BORRANDO CACHÉ
RUN apk update && apk add nginx --no-cache
RUN rm -rf /var/cache/apk/*

# CARPETAS NECESARIAS
RUN mkdir -p /etc/nginx/sites-enabled /var/run/nginx /var/www/html

# Copiamos ficheros que necesitamos
COPY ./cp/* /

# DAMOS PERMISOS AL ENTRYPOINT
RUN chmod +x /entrypoint

# CREAMOS USUARIOS PARA TENER EL MÍNIMO PRIVILEGIO
RUN addgroup data
RUN adduser -D -G data -s /bin/ash data
RUN chown -R data:data /etc/nginx
RUN chown -R data:data /var/log/nginx
RUN chown -R data:data /var/lib/nginx
RUN chown -R data:data /run/nginx
RUN chown -R data:data /var/run/nginx
RUN chown -R data:data /var/www/html
WORKDIR /etc/nginx

# ESTA LÍNEA SE USA PARA MATAR EL CONTENEDOR RÁPIDO
STOPSIGNAL SIGINT

# EJECUTAMOS ENTRYPOINT
ENTRYPOINT ["/entrypoint"]