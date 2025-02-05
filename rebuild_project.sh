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

# Executa o XcodeGen, se necessário
if command -v xcodegen &> /dev/null
then
    echo "👩🏼‍💻 Rodando XcodeGen..."
    xcodegen generate
else
    echo "⚠️  XcodeGen não encontrado! Instale com 'brew install xcodegen'"
fi

echo "🚀 Abrindo o projeto..."
open GitHubPocket.xcworkspace

echo "✅ Configuração concluída!"
