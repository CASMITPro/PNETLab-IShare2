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
  * Capacidad de RAM 8GB o Superior
  * Activacion de Caracteristica Procesador: 
<img width="726" height="212" alt="{B53BACD1-37ED-4AC6-BC07-E7A4C6107EBB}" src="https://github.com/user-attachments/assets/12f3a446-7eed-47f1-92f4-9a18036cb195" />

- Instalacion de Ubuntu 20.04.6:
<img width="804" height="584" alt="{2E8F3276-6AF2-435C-B91E-6204DA66C075}" src="https://github.com/user-attachments/assets/79f10d2b-8f04-4492-923b-15979ffb16dc" />

```bash
Configurar Dirrecionamiento IP segun el rango del segmento NAT de VMWware:
```

<img width="799" height="580" alt="{6F9000FC-C74F-46AF-A5FD-D49FF16E92C0}" src="https://github.com/user-attachments/assets/50f687d8-7ee1-4c36-ba0f-dc724be506c7" />

```bash
Creacion de Usuario:
User: pnet
Pass: pnet
Name Server: pnetlab
```
<img width="799" height="584" alt="{1058291E-23B2-46C1-9768-C7D5B431E81A}" src="https://github.com/user-attachments/assets/e180f298-7f2e-4034-85e1-1f16e399c6d6" />

## ⚙️ Instalación

```bash
git clone https://github.com/CASMITPro/PNETLab-IShare2.git
cd PNETLab-IShare2
chmod +x install.sh
sudo ./install.sh

