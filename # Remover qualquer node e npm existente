# Remover qualquer node e npm existente
sudo apt purge -y nodejs npm
sudo rm -rf /usr/local/lib/node_modules
sudo rm -rf ~/.npm
sudo rm -rf ~/.nvm
sudo apt autoremove -y

#Instalação do Node > 20
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs

# Verificar versões instaladas
node -v
npm -v

# Atualizar a versão do npm caso não estja > 10
sudo npm install -g npm@latest

# Instalar gerenciador de versões
sudo npm install -g n
sudo n stable

#Instalar o Expo CLI globalmente
sudo npm install -g expo

# Verificar versão instalada
expo --version


#Criar o app React Native
#No terminal:
mkdir ~/dev
cd ~/dev
npx create-expo-app hello-world

cd hello-world

#Ativar modo desenvolvedor no celular Android
#No seu celular:
#Vá em Configurações → Sobre o telefone
#Toque 7 vezes em “Número da versão” para ativar o Modo desenvolvedor
#Volte e entre em Opções do desenvolvedor
#Ative:
#Depuração USB
#(Opcional) Instalar via USB
#Conecte o celular no seu PC via cabo USB e, se aparecer um alerta pedindo autorização, aceite.

#Instalar pacote adb
sudo apt install android-tools-adb -y

adb devices

#instalar o ngrok manualmente (local)
#Rode isto dentro do seu projeto:
npm install @expo/ngrok@^4.1.0 --save-dev

#Rodar o app no celular (sem Android Studio)
#No terminal, dentro da pasta do app:
npx expo start --tunnel

#Por fim, rode normalmente:
npx expo start --lan
#e abra o app Expo Go no celular → escaneie o QR code.

#O arquivo principal do seu app é app/index.tsx.
#É nele que colocaremos o nosso "Hello World".

#Abra app/index.tsx e substitua o conteúdo por:
import { Text, View } from 'react-native';

export default function Index() {
  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
      <Text style={{ fontSize: 22 }}>Hello, Anderson 👋</Text>
    </View>
  );
}

#Salve o arquivo (Ctrl + S).