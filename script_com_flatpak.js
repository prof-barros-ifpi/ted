#!/bin/bash
# Script de instalação de ambiente de desenvolvimento no Linux Mint
# Uso: sudo bash setup_dev_env.sh

echo "=== Atualizando sistema ==="
apt update && apt upgrade -y

echo "=== Instalando utilitários básicos ==="
apt install -y build-essential curl wget git unzip zip software-properties-common apt-transport-https gnupg lsb-release flatpak

echo "=== Ativando repositório Flathub ==="
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "=== Instalando OpenJDK 21 ==="
apt install -y openjdk-21-jdk

echo "=== Instalando NetBeans 25 ==="
wget https://downloads.apache.org/netbeans/netbeans-installers/25/netbeans-25-bin-linux-x64.sh -O /tmp/netbeans.sh
chmod +x /tmp/netbeans.sh
bash /tmp/netbeans.sh --silent

echo "=== Instalando IntelliJ IDEA Community (Flatpak) ==="
flatpak install -y flathub com.jetbrains.IntelliJ-IDEA-Community

echo "=== Instalando Eclipse (Flatpak) ==="
flatpak install -y flathub org.eclipse.Java

echo "=== Instalando Visual Studio Code (Flatpak) ==="
flatpak install -y flathub com.visualstudio.code

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

echo "=== Instalando pacotes globais para desenvolvimento web (React, RN, Angular, Express) ==="
npm install -g create-react-app react-native-cli @angular/cli express-generator

echo "=== Instalando MongoDB ==="
apt install -y mongodb

echo "=== Instalando Android Studio (Flatpak) ==="
flatpak install -y flathub com.google.AndroidStudio

echo "=== Instalando Flutter ==="
git clone https://github.com/flutter/flutter.git -b stable /opt/flutter
echo 'export PATH="$PATH:/opt/flutter/bin"' >> ~/.bashrc
source ~/.bashrc
flutter doctor

echo "=== Instalando navegador Chromium ==="
apt install -y chromium-browser

echo "=== Instalando extensões do VSCode ==="
flatpak run com.visualstudio.code --install-extension Dart-Code.flutter
flatpak run com.visualstudio.code --install-extension Dart-Code.dart-code
flatpak run com.visualstudio.code --install-extension ms-python.python
flatpak run com.visualstudio.code --install-extension ms-toolsai.jupyter
flatpak run com.visualstudio.code --install-extension esbenp.prettier-vscode
flatpak run com.visualstudio.code --install-extension dsznajder.es7-react-js-snippets
flatpak run com.visualstudio.code --install-extension ms-vscode.vscode-typescript-next
flatpak run com.visualstudio.code --install-extension ms-vscode-remote.remote-containers

echo "=== Instalação concluída! Reinicie a máquina para aplicar todas as configurações. ==="