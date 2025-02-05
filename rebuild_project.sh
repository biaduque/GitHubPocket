echo "Oi dev :) Iniciando configuração do projeto..."

# Verifica se o CocoaPods está instalado
if ! command -v pod &> /dev/null
then
    echo "⚠️  CocoaPods não encontrado! Instalando agora..."
    sudo gem install cocoapods
else
    echo "✅ CocoaPods já está instalado."
fi

echo "📦 Instalando pods..."
pod install

echo "👩🏼‍💻 Abrindo o projeto..."
open GitHubPocket.xcworkspace

echo "✅ Configuração concluída!"
