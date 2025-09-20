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
<img width="796" height="925" alt="{D607199C-BB20-41A0-B063-1D846D92C586}" src="https://github.com/user-attachments/assets/a61827df-7eae-4fa3-bcf8-ad63efcbea99" />

```bash
[?] Enable aria2c for accelerated downloads? (default: no)
[y/N]: y

[?] Perform SSL certificate validation for downloads? (default: yes)
[y/N]: y
[?] Select update channel (branch).
 1) dev
 2) main
[*] Enter the number of the desired branch (default: dev): 2
[✓] Branch selected: main
[i] Running 'ishare2 upgrade' to switch to this branch.

[!] Mirror Selection
iShare2 can download files from multiple mirror sources.

 1) Automatically rotate mirrors for reliability
 2) Always use: Google Drive mirror
 3) Always use: OneDrive mirror

[?] Enter your choice (default: 1): 1
[✓] Mirror rotation enabled (2 sources).
┌──────────────────────────────────────────────────────────────────────────────────────────────┐
│ Configuration completed successfully.                                                        │
│ You can now start using ishare2.                                                             │
│ [!] IMPORTANT:                                                                               │
│ - ishare2 is a free, open-source tool. If someone charged you for it, you've been scammed.   │
│ - Avoid unofficial sources. They may contain malicious code.                                 │
└──────────────────────────────────────────────────────────────────────────────────────────────┘
[i] Updating ishare2 to the selected 'main' branch...
[✓] iShare2 has been updated to the latest version from the 'main' branch.
```
