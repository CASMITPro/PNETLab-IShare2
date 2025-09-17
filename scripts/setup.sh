#!/bin/bash
# ┌────────────────────────────────────────────┐
# │  Instalador PNETLab+IShare2 - CASMITPro    │
# └────────────────────────────────────────────┘

set -e  # Detener ejecución ante errores
LOG="/var/log/pnetlab_ishare2_setup.log"
exec > >(tee -a "$LOG") 2>&1

echo "🔧 [1/2] Actualizando sistema..."
sudo apt update && sudo apt upgrade -y

echo "📦 [2/2] Instalando PNETLab v6..."
bash -c "$(curl -sL https://labhub.eu.org/api/raw/?path=/upgrades_pnetlab/focal/install_pnetlab_v6.sh)"

echo "🌐 Instalando iShare2 con configuración automática..."
wget -O /usr/sbin/ishare2 https://raw.githubusercontent.com/ishare2-org/ishare2-cli/main/ishare2 && \
chmod +x /usr/sbin/ishare2 && \
echo "y" | ishare2 && \
cd ishare2-cli && \
cp ishare2 /usr/sbin/ && \
cd /usr/sbin && \
chmod +x ishare2 && \
ishare2

echo "✅ Instalación completada con éxito."
echo "📄 Log disponible en: $LOG"
echo "ℹ️ Puedes reconfigurar iShare2 con: ishare2 config"
