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
read -p "🌐 [4/4] ¿Deseas instalar iShare2 CLI ahora? (s/n): " RESPUESTA

if [[ "$RESPUESTA" =~ ^[sS]$ ]]; then
    echo "📥 Clonando iShare2 CLI desde GitHub..."
    git clone https://github.com/ishare2-org/ishare2-cli.git
    cd ishare2-cli
    cp ishare2 /usr/sbin/
    cd /usr/sbin
    chmod +x /usr/sbin/ishare2

    echo "🧪 Ejecutando iShare2 CLI..."
    ishare2 || echo "⚠️ iShare2 encontró errores durante la ejecución."

    echo "✅ iShare2 instalado y ejecutado."
else
    echo "⏹ Instalación de iShare2 cancelada por el usuario."
fi

echo ""
read -p "🔁 ¿Deseas reiniciar el sistema ahora para completar la instalación? (s/n): " REINICIO

if [[ "$REINICIO" =~ ^[sS]$ ]]; then
    echo "🔄 Reiniciando el sistema..."
    reboot
else
    echo "⏹ Reinicio cancelado. Puedes hacerlo manualmente más adelante con el comando: sudo reboot"
fi
