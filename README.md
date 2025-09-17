# 🚀 PNETLab+IShare2 Installer
<img width="1280" height="720" alt="image" src="https://github.com/user-attachments/assets/df285d06-84b0-4341-9e4b-3a990822e2e2" />

Instalador automatizado para configurar Ubuntu Server con PNETLab v6 e iShare2 CLI, optimizado para laboratorios técnicos reproducibles bajo CASMITPro.

## 📦 Características

- Actualización del sistema
- Instalación de PNETLab v6
- Instalación automatizada de iShare2 con aria2c activado
- Logging completo en `/var/log/pnetlab_ishare2_setup.log`

## 🧰 Requisitos

- Ubuntu Server 20.04 [Link](https://releases.ubuntu.com/focal/)
- Creacion de VM en VMware Workstation Pro:
  * Espacion Disco Duro 100GB o Superior
  * Configuracion de Tarjeta de red modo NAT.
  * Capacidad de RAM 8GB o Superior
  * Activacion de Caracteristica Procesador:
    - Virtualize Intel VT-x/EPT or AMD-V/RVI
         
- Instalacion de Ubuntu 20.04.6:
  * Instalar OS y no Actualizar.
  * Configurarion de Segmento de Red
    - SubNET: 192.168.56.0/24
    - Address: 192.168.56.100
    - Gateway: 192.168.56.2
    - DNS: 8.8.8.8,1.1.1.1
  * Creacion de Usuario:
    - Usuario: pnet
    - Password: pnet
    - Hostname: pnetlab 

## ⚙️ Instalación

```bash
git clone https://github.com/CASMITPro/PNETLab-IShare2.git
cd PNETLab-IShare2
chmod +x install.sh
sudo ./install.sh

