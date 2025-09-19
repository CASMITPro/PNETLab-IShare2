#!/bin/bash
# ┌────────────────────────────────────────────────────────┐
# │   Módulo CASMITPro: Instalación iShare2 + Herramientas │
# └────────────────────────────────────────────────────────┘

set -e
LOG="/var/log/casmitpro_ishare2.log"
exec > >(tee -a "$LOG") 2>&1

echo "🔧 [1/3] Actualizando sistema y preparando entorno..."
sudo apt update && \
sudo apt upgrade -y && \
sudo apt install -y curl wget git aria2 jq unrar tree unzip

echo "🌐 [2/3] Instalando iShare2 CLI..."
wget -O /usr/sbin/ishare2 https://raw.githubusercontent.com/ishare2-org/ishare2-cli/main/ishare2
chmod +x /usr/sbin/ishare2

echo "🔐 [3/3] Configurando permisos seguros para el usuario 'pnet'..."
sudo groupadd -f pnet
sudo usermod -aG pnet pnet
sudo chown root:pnet /usr/sbin/ishare2
sudo chmod 750 /usr/sbin/ishare2
echo "pnet ALL=(ALL) NOPASSWD: /usr/sbin/ishare2" | sudo tee /etc/sudoers.d/ishare2 > /dev/null

echo "🧪 Ejecutando iShare2 CLI..."
sudo ishare2

echo "✅ Instalación completada con éxito."
echo "📄 Log disponible en: $LOG"
echo "👤 El usuario 'pnet' puede ejecutar: sudo ishare2"
echo "ℹ️ Reconfiguración disponible con: ishare2 config"
