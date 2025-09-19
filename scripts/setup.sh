#!/bin/bash
set -e

LOG="/var/log/casmitpro_setup.log"
exec > >(tee -a "$LOG") 2>&1

echo "🔧 [1/4] Actualizando sistema y preparando entorno..."
apt update && apt upgrade -y

echo "🧱 [2/4] Instalando PNETLab v6 desde LabHub..."
bash -c "$(curl -sL https://labhub.eu.org/api/raw/?path=/upgrades_pnetlab/focal/install_pnetlab_v6.sh)" || {
    echo "❌ Error al instalar PNETLab. Abortando."
    exit 1
}

echo "✅ [3/4] Instalación de PNETLab completada con éxito."
echo "📄 Log disponible en: $LOG"

echo ""
read -p "❓ [4/4] ¿Deseas continuar con la instalación de iShare2 CLI? (s/n): " RESPUESTA

if [[ "$RESPUESTA" =~ ^[sS]$ ]]; then
    echo "🌐 Instalando iShare2 CLI desde GitHub..."
    git clone https://github.com/ishare2-org/ishare2-cli.git
    cd ishare2-cli
    cp ishare2 /usr/sbin/
    cd /usr/sbin
    chmod +x /usr/sbin/ishare2

    echo "🧪 Ejecutando iShare2 CLI..."
    ishare2 || echo "⚠️ iShare2 encontró errores durante la ejecución."

    echo "✅ Instalación y ejecución de iShare2 completadas."
else
    echo "⏹ Instalación de iShare2 cancelada por el usuario."
    echo "ℹ️ Puedes instalarlo manualmente más adelante ejecutando: git clone https://github.com/ishare2-org/ishare2-cli.git"
fi
