#!/bin/ash
# Provisiona o Pelican apos a instalacao web:
# 1. aguarda o usuario concluir o instalador (APP_INSTALLED=true no .env)
# 2. cria o no padrao "Umbrel", se ainda nao existir
# 3. gera /etc/pelican/config.yml do wings apontando o painel pelo DNS interno

set -u

ENV_FILE=/pelican-data/.env
WINGS_CONFIG_DIR=/wings-config

echo "[provisioner] aguardando a conclusao do instalador web..."
until grep -q '^APP_INSTALLED=true' "$ENV_FILE" 2>/dev/null; do
  sleep 10
done
echo "[provisioner] instalacao concluida, provisionando o no local..."

# As migrations rodam no final do instalador; retemos ate a config poder ser lida
attempt=0
until [ "$attempt" -ge 30 ]; do
  attempt=$((attempt + 1))

  NODE_ID=""
  if php artisan p:node:configuration 1 >/dev/null 2>&1; then
    NODE_ID=1
  else
    OUT=$(php artisan p:node:make \
      --name="Umbrel" \
      --description="No local provisionado automaticamente" \
      --fqdn="umbrel.local" \
      --public=1 \
      --scheme=http \
      --proxy=0 \
      --maintenance=0 \
      --maxMemory=0 \
      --overallocateMemory=-1 \
      --maxDisk=0 \
      --overallocateDisk=-1 \
      --maxCpu=0 \
      --overallocateCpu=-1 \
      --uploadSize=256 \
      --daemonListeningPort=8080 \
      --daemonConnectingPort=8080 \
      --daemonSFTPPort=2022 \
      --daemonSFTPAlias= \
      --daemonBase=/var/lib/pelican/volumes </dev/null 2>&1) || true
    NODE_ID=$(echo "$OUT" | sed -n 's/.*has an id of \([0-9]*\).*/\1/p')
  fi

  if [ -n "$NODE_ID" ]; then
    CFG=$(php artisan p:node:configuration "$NODE_ID" --format=yaml 2>/dev/null)
    if [ -n "$CFG" ]; then
      # troca a URL do painel pelo endereco interno (DNS do docker-compose)
      echo "$CFG" | sed "s|^remote: .*|remote: 'http://panel'|" > "$WINGS_CONFIG_DIR/config.yml.tmp"
      mv "$WINGS_CONFIG_DIR/config.yml.tmp" "$WINGS_CONFIG_DIR/config.yml"
      echo "[provisioner] config do wings sincronizada (no $NODE_ID)."
      exit 0
    fi
  fi

  sleep 10
done

echo "[provisioner] nao foi possivel provisionar o no apos 30 tentativas."
exit 1
