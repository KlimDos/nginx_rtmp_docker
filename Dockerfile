FROM debian:stable
RUN set -eux; \
  export DEBIAN_FRONTEND=noninteractive; \
  apt-get update -q; \
  apt-get dist-upgrade -qy; \
  apt-get install -qy --no-install-recommends nginx-light libnginx-mod-rtmp; \
  rm -rf /var/lib/apt/lists/*; \
  rm -f /var/www/html/index.nginx-debian.html; \
  nginx -V

VOLUME /usr/share/nginx/html

EXPOSE 1935/tcp
EXPOSE 1935/udp

ENTRYPOINT ["/bin/bash", "-c", "exec nginx"]