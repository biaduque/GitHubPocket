echo "Oi dev :) Iniciando configuração do projeto..."

echo "📦 Instalando pods..."
pod install

echo "👩🏼‍💻 Rodando XcodeGen..."
xcodegen generate

echo "🚀 Abrindo o projeto..."
open GitHubPocket.xcworkspace

echo "✅ Configuração concluída!"
