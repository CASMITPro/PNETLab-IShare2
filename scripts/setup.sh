#!/bin/bash
set -e

LOG="/var/log/casmitpro_setup.log"
exec > >(tee -a "$LOG") 2>&1

ISHARE2_DEPS=("curl" "wget" "jq" "unrar" "tree" "unzip")

check_and_install_deps() {
    echo "📦 Verificando dependencias de iShare2..."
    apt --fix-broken install -y
    apt update
    for pkg in "${ISHARE2_DEPS[@]}"; do
        if ! dpkg -s "$pkg" &>/dev/null; then
            echo "➡️ Instalando $pkg..."
            apt install -y "$pkg"
        else
            echo "✔️ $pkg ya está instalado."
        fi
    done
}

# Verificar permisos
if [[ $EUID -ne 0 ]]; then
    echo "❌ Este script debe ejecutarse como root."
    exit 1
fi

echo "🔧 [1/4] Actualizando sistema y preparando entorno..."
apt update -o Dpkg::Progress-Fancy=1 && apt upgrade -y
apt install -y git curl

echo "🧱 [2/4] Instalando PNETLab v6 desde LabHub..."
if ! bash -c "$(curl -sL https://labhub.eu.org/api/raw/?path=/upgrades_pnetlab/focal/install_pnetlab_v6.sh)"; then
    echo "❌ Error al instalar PNETLab. Revisa el log: $LOG"
    exit 1
fi

echo "✅ [3/4] Instalación de PNETLab completada con éxito."
echo "📄 Log disponible en: $LOG"

echo ""
read -p "❓ [4/4] ¿Deseas continuar con la instalación de iShare2 CLI? (s/n): " RESPUESTA

if [[ "$RESPUESTA" =~ ^[sS]$ ]]; then
    echo "🌐 Instalando iShare2 CLI desde GitHub..."
    rm -rf ishare2-cli
    git clone https://github.com/ishare2-org/ishare2-cli.git
    cd ishare2-cli

    # 🔑 Instalar dependencias ANTES de ejecutar iShare2
    check_and_install_deps

    install -m 755 ishare2 /usr/local/bin/

    echo "🧪 Ejecutando iShare2 CLI sin instalador de dependencias..."
    ISHARE2_SKIP_DEPS=1 ishare2 || echo "⚠️ iShare2 encontró errores durante la ejecución."

    echo "✅ iShare2 instalado y ejecutado."
else
    echo "⏹ Instalación de iShare2 cancelada por el usuario."
fi
