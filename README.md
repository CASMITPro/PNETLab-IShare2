# 🚀 PNETLab+IShare2 Installer

Instalador automatizado para configurar Ubuntu Server con PNETLab v6 e iShare2 CLI, optimizado para laboratorios técnicos reproducibles bajo CASMITPro.

## 📦 Características

- Actualización del sistema
- Instalación de PNETLab v6
- Instalación automatizada de iShare2 con aria2c activado
- Logging completo en `/var/log/pnetlab_ishare2_setup.log`

## 🧰 Requisitos

- Ubuntu Server 20.04 o superior
- Acceso root o sudo
- Conexión a internet

## ⚙️ Instalación

```bash
git clone https://github.com/tuusuario/PNETLab-IShare2.git
cd PNETLab-IShare2
chmod +x install.sh
sudo ./install.sh

