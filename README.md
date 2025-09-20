# 🚀 PNETLab+IShare2 Installer

Instalador automatizado para configurar Ubuntu Server con PNETLab v6 e iShare2 CLI, optimizado para laboratorios técnicos.

## 📦 Características

- Actualización del sistema
- Instalación de PNETLab v6
- Instalación de iShare2

## 🧰 Requisitos

- Ubuntu Server 20.04 [Link](https://releases.ubuntu.com/focal/)
- Creacion de VM en VMware Workstation Pro:
  * Espacion Disco Duro 100GB o Superior
  * Configuracion de Tarjeta de red modo NAT.
  * Capacidad de RAM 8GB o Superior
  * Activacion de Caracteristica Procesador:
    - Virtualize Intel VT-x/EPT or AMD-V/RVI
 <img width="736" height="204" alt="{DF384D60-B86D-4515-8443-568AD67964E4}" src="https://github.com/user-attachments/assets/502d5f8e-2f66-485e-a339-7cd2bb9bb9c7" />

## ⚙️ Configuracion de VM y OS

- Instalacion de Ubuntu 20.04.6:
  * Instalar OS y no Actualizar.
  * Configurarion de Segmento de Red
    - DHCP o Estatico
  * Creacion de Usuario:
    - Usuario: pnet
    - Password: pnet
    - Hostname: pnetlab 

## ⚙️ Instalación

```bash
git clone https://github.com/CASMITPro/PNETLab-IShare2.git
cd PNETLab-IShare2
chmod +x install_pnetlab.sh
sudo ./install_pnetlab.sh
```

## ⚙️ Instalación Interactiva de iShare2
<img width="972" height="1541" alt="image" src="https://github.com/user-attachments/assets/71564ec0-8ed2-43ba-902c-9e7b61e27e31" />

# 🚀 A Disfrutar PNETLab e iShare2!!!!!
