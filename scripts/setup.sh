#!/bin/bash
# ┌────────────────────────────────────────────┐
# │  Script de Configuración Ubuntu + CASMITPro │
# └────────────────────────────────────────────┘

set -e  # Detener ejecución ante cualquier error
LOG="/var/log/casmitpro_setup.log"
exec > >(tee -a "$LOG") 2>&1

echo "🔧 [1/3] Actualizando sistema y preparando entorno..."
sudo apt update && \
sudo apt upgrade -y && \
sudo apt install -y curl wget git aria2

echo "📦 [2/3] Instalando PNETLab v6..."
bash -c "$(curl -sL https://labhub.eu.org/api/raw/?path=/upgrades_pnetlab/focal/install_pnetlab_v6.sh)"

echo "🌐 [3/3] Instalando iShare2 CLI con configuración automatizada..."
wget -O /usr/sbin/ishare2 https://raw.githubusercontent.com/ishare2-org/ishare2-cli/main/ishare2 && \
chmod +x /usr/sbin/ishare2 && \
echo -e "y\n1\n2\n3\n" | /usr/sbin/ishare2 && \
cd ishare2-cli && \
cp ishare2 /usr/sbin/ && \
cd /usr/sbin && \
chmod +x ishare2 && \
/usr/sbin/ishare2

echo "🔐 Configurando permisos para el usuario 'pnet'..."
sudo groupadd -f pnet
sudo usermod -aG pnet pnet
sudo chown root:pnet /usr/sbin/ishare2
sudo chmod 750 /usr/sbin/ishare2
echo "pnet ALL=(ALL) NOPASSWD: /usr/sbin/ishare2" | sudo tee /etc/sudoers.d/ishare2 > /dev/null

echo "✅ Instalación completada con éxito."
echo "📄 Log disponible en: $LOG"
echo "ℹ️ Puedes reconfigurar iShare2 con: ishare2 config"
echo "👤 El usuario 'pnet' puede ejecutar: sudo ishare2"
