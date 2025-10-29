#!/bin/bash
# ----------------------------------------------
# Instalação completa do ambiente React Native + Expo (Linux Mint)
# via Node.js 20.x e ADB para conexão com smartphone via USB
# ----------------------------------------------

echo "🚀 Iniciando configuração do ambiente React Native com Expo..."

# 1️⃣ Remover qualquer Node e NPM existentes
echo "🧹 Removendo versões antigas do Node.js e NPM..."
sudo apt purge -y nodejs npm
sudo rm -rf /usr/local/lib/node_modules
sudo rm -rf ~/.npm
sudo rm -rf ~/.nvm
sudo apt autoremove -y

# 2️⃣ Instalar Node.js 20.x
echo "📦 Instalando Node.js versão 20..."
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs

# 3️⃣ Atualizar o npm para a versão mais recente
echo "⬆️ Atualizando npm..."
sudo npm install -g npm@latest

# 4️⃣ Instalar gerenciador de versões 'n' e configurar Node estável
echo "⚙️ Instalando gerenciador de versões 'n'..."
sudo npm install -g n
sudo n stable

# 5️⃣ Instalar Expo CLI globalmente
echo "🌍 Instalando Expo CLI..."
sudo npm install -g expo

# 6️⃣ Instalar ADB (Android Debug Bridge)
echo "📱 Instalando Android Tools (adb)..."
sudo apt install -y android-tools-adb

# 7️⃣ Configurar permissão para reconhecer o celular Android via USB
echo "🔧 Configurando permissões para dispositivos Android..."
sudo bash -c 'cat <<EOF > /etc/udev/rules.d/51-android.rules
SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", MODE="0666", GROUP="plugdev"
EOF'
sudo udevadm control --reload-rules
sudo service udev restart
sudo usermod -aG plugdev $USER

# 8️⃣ Testar instalação
echo "✅ Testando versões instaladas..."
node -v
npm -v
expo --version
adb version

# 9️⃣ Testar detecção de dispositivo Android
echo "🔍 Verificando se o dispositivo está conectado..."
adb devices

echo "🎉 Instalação concluída!"
echo "➡️ Agora, desconecte e reconecte o celular via USB e confirme que aparece na lista do comando 'adb devices'."
echo "➡️ Depois, crie seu projeto com: npx create-expo-app meuApp"
echo "➡️ E inicie o app com: npx expo start --tunnel"

