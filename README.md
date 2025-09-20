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
```bash
┌──────────────────────────────────────────────────────┐
│ MOTD from the ishare2 team:                          │
│ Changelog:                                           │
│ - Added mirror rotation- Added dynamic mirror        │
│ options                                              │
│                                                      │
│ Telegram: https://t.me/NetLabHub                     │
│ Donate: https://buymeacoffee.com/sudoalex            │
│ GitHub: https://github.com/ishare2-org/ishare2-cli   │
└──────────────────────────────────────────────────────┘
Syntax

ishare2 [action] [param1] [param2] [--overwrite]

action:
    search      : Search for images available on LabHub mirrors.
    pull        : Download an image by specifying the type and id.
    installed   : Shows images installed on the server.
    labs        : Shows available labs and downloads the images for the selected lab.
    mylabs      : Same as labs command but you can use a customized path.
    relicense   : Generates an iourc license for iol images.
    upgrade     : Shows a menu to upgrade ishare2 or PNETLab.
    test        : Test internet connectivity to required sites.
    help        : Shows full help information.

param1:
    type = all, iol, qemu, dynamips, docker or name.

param2:
    id = This can be obtained using ishare2 search <type>

--overwrite:
    Used to overwrite an existing image if it already exists on your system.
```
```bash
Try: ishare2 help for more information.
✅ iShare2 instalado y ejecutado.

🔁 ¿Deseas reiniciar el sistema ahora para completar la instalación? (s/n): s
🔄 Reiniciando el sistema...
```
