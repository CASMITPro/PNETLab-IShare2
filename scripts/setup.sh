#!/bin/bash
set -e

LOG="/var/log/casmitpro_setup.log"
exec > >(tee -a "$LOG") 2>&1

echo "🔧 [1/3] Actualizando sistema y preparando entorno..."
apt update && \
apt upgrade -y && \
apt install -y curl wget git aria2 jq unrar tree unzip

echo "📦 [2/3] Instalando PNETLab v6..."
bash -c "$(curl -sL https://labhub.eu.org/api/raw/?path=/upgrades_pnetlab/focal/install_pnetlab_v6.sh)"

echo "🌐 [3/3] Instalando iShare2 CLI..."
wget -O /usr/sbin/ishare2 https://raw.githubusercontent.com/ishare2-org/ishare2-cli/main/ishare2
chmod +x /usr/sbin/ishare2

echo "🔐 Configurando permisos para el usuario 'pnet'..."
groupadd -f pnet
usermod -aG pnet pnet
chown root:pnet /usr/sbin/ishare2
chmod 750 /usr/sbin/ishare2
echo "pnet ALL=(ALL) NOPASSWD: /usr/sbin/ishare2" > /etc/sudoers.d/ishare2
chmod 440 /etc/sudoers.d/ishare2

echo "🧪 Ejecutando iShare2 CLI..."
sudo ishare2

echo "✅ Instalación completada con éxito."
echo "📄 Log disponible en: $LOG"
echo "👤 El usuario 'pnet' puede ejecutar: sudo ishare2"
echo "ℹ️ Reconfiguración disponible con: ishare2 config"
