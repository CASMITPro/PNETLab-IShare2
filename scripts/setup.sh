#!/bin/bash
set -e

LOG="/var/log/casmitpro_setup.log"
exec > >(tee -a "$LOG") 2>&1

echo "🔧 [1/3] Actualizando sistema y preparando entorno..."
apt update && apt upgrade -y

echo "🧱 [2/3] Instalando PNETLab v6 desde LabHub..."
bash -c "$(curl -sL https://labhub.eu.org/api/raw/?path=/upgrades_pnetlab/focal/install_pnetlab_v6.sh)" || {
    echo "❌ Error al instalar PNETLab. Abortando."
    exit 1
}

echo "✅ [3/3] Instalación de PNETLab completada con éxito."
echo "📄 Log disponible en: $LOG"
