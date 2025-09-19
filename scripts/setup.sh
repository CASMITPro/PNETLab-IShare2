#!/bin/bash
set -e

LOG="/var/log/pnetlab_installer.log"
exec > >(tee -a "$LOG") 2>&1

echo "🔧 [1/4] Actualizando sistema y preparando entorno..."
apt update && apt upgrade -y

echo "📦 [2/4] Instalando dependencias necesarias..."
apt install -y curl wget git aria2 jq unrar tree unzip || {
    echo "❌ Error al instalar dependencias. Intenta ejecutar: apt --fix-broken install"
    exit 1
}

echo "🧠 Validación de dependencias completada."

echo "🧱 [3/4] Instalando PNETLab v6..."
bash -c "$(curl -sL https://labhub.eu.org/api/raw/?path=/upgrades_pnetlab/focal/install_pnetlab_v6.sh)" || {
    echo "❌ Error al instalar PNETLab. Verifica la conexión o el script remoto."
    exit 1
}

echo "🌐 [4/4] Instalando iShare2 CLI..."
wget -O /usr/sbin/ishare2 https://raw.githubusercontent.com/ishare2-org/ishare2-cli/main/ishare2
chmod +x /usr/sbin/ishare2

echo "🔐 Configurando permisos para el usuario 'pnet'..."
if id "pnet" &>/dev/null; then
    groupadd -f pnet
    usermod -aG pnet pnet
    chown root:pnet /usr/sbin/ishare2
    chmod 750 /usr/sbin/ishare2
    echo "pnet ALL=(ALL) NOPASSWD: /usr/sbin/ishare2" > /etc/sudoers.d/ishare2
    chmod 440 /etc/sudoers.d/ishare2
else
    echo "⚠️ El usuario 'pnet' no existe. Saltando configuración de permisos."
fi

echo "🧪 Ejecutando iShare2 CLI..."
if command -v ishare2 >/dev/null 2>&1; then
    sudo ishare2 || echo "⚠️ iShare2 encontró errores durante la ejecución."
else
    echo "❌ iShare2 no está disponible. Verifica la instalación."
fi

echo "✅ Instalación completada con éxito."
echo "📄 Log disponible en: $LOG"
echo "👤 El usuario 'pnet' puede ejecutar: sudo ishare2"
echo "ℹ️ Reconfiguración disponible con: ishare2 config"
