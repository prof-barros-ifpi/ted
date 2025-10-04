#!/bin/bash
# Script de instalação de ambiente de desenvolvimento no Linux Mint
# Autor: Anderson (com apoio do ChatGPT 😉)
# Uso: sudo bash setup_dev_env.sh

echo "=== Atualizando sistema ==="
apt update && apt upgrade -y

echo "=== Instalando utilitários básicos ==="
apt install -y build-essential curl wget git unzip zip software-properties-common apt-transport-https gnupg lsb-release

echo "=== Instalando OpenJDK 21 ==="
apt install -y openjdk-21-jdk

echo "=== Instalando NetBeans 25 ==="
wget https://downloads.apache.org/netbeans/netbeans-installers/25/netbeans-25-bin-linux-x64.sh -O /tmp/netbeans.sh
chmod +x /tmp/netbeans.sh
bash /tmp/netbeans.sh --silent

echo "=== Instalando IntelliJ IDEA Community ==="
snap install intellij-idea-community --classic

echo "=== Instalando Eclipse ==="
snap install eclipse --classic

echo "=== Instalando Visual Studio Code ==="
snap install code --classic

echo "=== Instalando Anaconda ==="
wget https://repo.anaconda.com/archive/Anaconda3-2024.06-1-Linux-x86_64.sh -O /tmp/anaconda.sh
bash /tmp/anaconda.sh -b -p /opt/anaconda
echo 'export PATH="/opt/anaconda/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

echo "=== Instalando Pygame ==="
/opt/anaconda/bin/conda install -y -c cogsci pygame

echo "=== Instalando Umbrello (UML) ==="
apt install -y umbrello

echo "=== Instalando Node.js (LTS) e npm ==="
curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
apt install -y nodejs

echo "=== Instalando pacotes globais para desenvolvimento web ==="
npm install -g create-react-app react-native-cli @angular/cli express-generator

echo "=== Instalando MongoDB ==="
apt install -y mongodb

echo "=== Instalando Android Studio ==="
snap install android-studio --classic

echo "=== Instalando Flutter ==="
git clone https://github.com/flutter/flutter.git -b stable /opt/flutter
echo 'export PATH="$PATH:/opt/flutter/bin"' >> ~/.bashrc
source ~/.bashrc
flutter doctor

echo "=== Instalando navegador Chromium ==="
apt install -y chromium-browser

echo "=== Instalação concluída! Reinicie a máquina para aplicar todas as configurações. ==="
