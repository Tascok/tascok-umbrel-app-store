#!/bin/ash
# espera o init liberar a permissao do bind antes de subir o painel
until [ -w /pelican-data ]; do
  echo "[panel] aguardando permissoes do init..."
  sleep 2
done
exec /bin/ash /entrypoint.sh supervisord -n -c /etc/supervisord.conf
