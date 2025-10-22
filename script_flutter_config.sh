#!/usr/bin/env bash
# ============================================
# CONFIGURAÇÃO DO FLUTTER NO LINUX MINT
# Android Studio, VS Code e JDK já instalados
# ============================================

set -e

echo "=== Atualizando o sistema e instalando dependências básicas ==="
sudo apt update && sudo apt install -y \
  curl git unzip xz-utils zip libglu1-mesa \
  clang cmake ninja-build pkg-config libgtk-3-dev \
  android-sdk-platform-tools-common

echo
echo "=== Clonando Flutter SDK na pasta padrão: $HOME/flutter ==="
if [ ! -d "$HOME/flutter" ]; then
  git clone https://github.com/flutter/flutter.git -b stable $HOME/flutter
else
  echo "Flutter já existe em $HOME/flutter — pulando clone."
fi

echo
echo "=== Configurando variáveis de ambiente ==="
FLUTTER_PATH_LINE='export PATH="$PATH:$HOME/flutter/bin"'
ANDROID_SDK_LINE='export ANDROID_SDK_ROOT="$HOME/Android/Sdk"'
ANDROID_PATH_LINE='export PATH="$PATH:$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/tools/bin"'

for LINE in "$FLUTTER_PATH_LINE" "$ANDROID_SDK_LINE" "$ANDROID_PATH_LINE"; do
  if ! grep -Fxq "$LINE" ~/.bashrc; then
    echo "$LINE" >> ~/.bashrc
  fi
done

# Recarregar variáveis
source ~/.bashrc

echo
echo "=== Configurando regras UDEV para acesso ADB sem sudo ==="
sudo curl -L -o /etc/udev/rules.d/51-android.rules \
  https://raw.githubusercontent.com/snowdream/51-android/master/51-android.rules
sudo chmod a+r /etc/udev/rules.d/51-android.rules
sudo usermod -aG plugdev $USER
sudo udevadm control --reload-rules && sudo udevadm trigger

echo
echo "=== Atualizando permissões e verificando adb ==="
adb kill-server || true
adb start-server
adb devices || true

echo
echo "=== Verificando instalação do Flutter ==="
flutter --version || true
flutter doctor -v || true

echo
echo "✅ Configuração concluída!"
echo "Saia e entre novamente no sistema (ou rode 'source ~/.bashrc') para ativar variáveis."
echo "Depois conecte o celular com 'Depuração USB' ativada e execute:"
echo "    flutter devices"
echo "    flutter create meu_app"
echo "    cd meu_app && flutter run"
