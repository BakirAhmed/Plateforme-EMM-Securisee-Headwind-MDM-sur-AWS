#!/usr/bin/env bash
# A executer EN ROOT sur l'instance EC2, via une session Session Manager,
# une fois l'Elastic IP allouee et associee (sortie Terraform "mdm_public_ip").
#
# Usage :
#   sudo -i
#   PUBLIC_IP="<sortie mdm_public_ip>" ADMIN_EMAIL="formation@example.invalid" bash deploy-headwind.sh
set -euo pipefail

PUBLIC_IP="${PUBLIC_IP:?Definir PUBLIC_IP (Elastic IP de l'instance)}"
ADMIN_EMAIL="${ADMIN_EMAIL:-formation@example.invalid}"
BASE_DOMAIN="${PUBLIC_IP}.sslip.io"

cd /opt/headwind-mdm

SQL_PASS=$(openssl rand -base64 24 | tr -d '=+/ ' | cut -c1-20)
SHARED_SECRET=$(openssl rand -hex 24)

cat > .env <<ENV
SQL_BASE=hmdm
SQL_USER=hmdm
SQL_PASS=${SQL_PASS}
ADMIN_EMAIL=${ADMIN_EMAIL}
BASE_DOMAIN=${BASE_DOMAIN}
LOCAL_IP=
FORCE_RECONFIGURE=true
PROTOCOL=https
SHARED_SECRET=${SHARED_SECRET}
HMDM_VARIANT=os
DOWNLOAD_CREDENTIALS=
HMDM_URL=https://h-mdm.com/files/hmdm-5.38.1-os.war
CLIENT_VERSION=6.31
ENV
chmod 600 .env

cp /opt/headwind-mdm/../docker-compose.yaml /opt/headwind-mdm/docker-compose.yaml 2>/dev/null || true

echo "Fichier .env genere pour BASE_DOMAIN=${BASE_DOMAIN}"
echo "Lancer ensuite :"
echo "  cd /opt/headwind-mdm && docker compose pull && docker compose up -d"
echo "Puis, une fois valide :"
echo "  sed -i 's/^FORCE_RECONFIGURE=true/FORCE_RECONFIGURE=false/' .env && docker compose restart hmdm"
