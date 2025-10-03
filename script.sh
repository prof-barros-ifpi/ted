#!/bin/bash

# ==================================================
# Script de instalação Flutter + VS Code + Android SDK + Emulador AVD
# Para Linux Mint (Ubuntu-based)
# ==================================================

echo ">>> Atualizando sistema e instalando dependências..."
sudo apt update
sudo apt install -y git curl unzip xz-utils zip libglu1-mesa clang cmake ninja-build pkg-config libgtk-3-dev openjdk-11-jdk wget qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager

# -------------------------------
# Instalar VS Code
# -------------------------------
echo ">>> Instalando VS Code..."
sudo apt install -y software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install -y code

# -------------------------------
# Instalar Flutter SDK
# -------------------------------
echo ">>> Baixando Flutter SDK..."
cd $HOME
if [ ! -d "$HOME/flutter" ]; then
  git clone https://github.com/flutter/flutter.git -b stable
fi
echo 'export PATH="$HOME/flutter/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# -------------------------------
# Configurar Android SDK
# -------------------------------
echo ">>> Configurando Android SDK..."
mkdir -p $HOME/Android/Sdk/cmdline-tools
cd $HOME/Android/Sdk/cmdline-tools
wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip -O cmdline-tools.zip
unzip -o cmdline-tools.zip
rm cmdline-tools.zip
mv cmdline-tools latest

# Variáveis de ambiente
echo 'export ANDROID_SDK_ROOT=$HOME/Android/Sdk' >> ~/.bashrc
echo 'export PATH=$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/tools/bin:$ANDROID_SDK_ROOT/platform-tools:$PATH' >> ~/.bashrc
source ~/.bashrc

# -------------------------------
# Aceitar licenças e instalar pacotes essenciais
# -------------------------------
echo ">>> Aceitando licenças do Android SDK..."
yes | flutter doctor --android-licenses

echo ">>> Instalando pacotes essenciais do Android SDK..."
sdkmanager --install "platform-tools" "platforms;android-33" "build-tools;33.0.2" "emulator" "system-images;android-33;google_apis;x86_64"

# -------------------------------
# Criar e configurar um emulador Android (AVD)
# -------------------------------
echo ">>> Criando emulador Android..."
echo "no" | avdmanager create avd -n flutter_emulator -k "system-images;android-33;google_apis;x86_64" --device "pixel"

# -------------------------------
# Verificar instalação
# -------------------------------
echo ">>> Verificação final do Flutter Doctor..."
flutter doctor

echo "================================================="
echo "Setup concluído!"
echo "Para iniciar o emulador use:"
echo "    emulator -avd flutter_emulator"
echo
echo "Depois rode seu app Flutter com:"
echo "    flutter run"
echo "================================================="
