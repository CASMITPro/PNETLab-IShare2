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
<img width="430" height="428" alt="{305E8303-F95F-4751-BD8A-334D73CA5D12}" src="https://github.com/user-attachments/assets/66d1e66a-07d5-4216-ae24-36bd64626017" />
<img width="427" height="429" alt="{115001DE-E2AE-45C7-BE6E-F507FF86E71A}" src="https://github.com/user-attachments/assets/072c29e5-0f6f-447b-ada3-e6bf80fac6e8" />
<img width="426" height="427" alt="{372528A4-E957-458F-9E2D-98E4BE76DFD5}" src="https://github.com/user-attachments/assets/8e59e457-1ed1-4e07-82bc-caf3067a2336" />
<img width="428" height="429" alt="{EAF9F145-7959-4F11-9B4D-1F847D04C350}" src="https://github.com/user-attachments/assets/8791c90d-9d40-4566-8fb3-23ccfb45bf8f" />
<img width="722" height="410" alt="{03031FA2-C19C-4FEF-8FF1-BDEF9080082B}" src="https://github.com/user-attachments/assets/3cbd488a-3906-404a-8e1b-cb3c86272fa3" />
<img width="726" height="212" alt="{B53BACD1-37ED-4AC6-BC07-E7A4C6107EBB}" src="https://github.com/user-attachments/assets/12f3a446-7eed-47f1-92f4-9a18036cb195" />


- Acceso root o sudo
- Conexión a internet

## ⚙️ Instalación

```bash
git clone https://github.com/CASMITPro/PNETLab-IShare2.git
cd PNETLab-IShare2
chmod +x install.sh
sudo ./install.sh

