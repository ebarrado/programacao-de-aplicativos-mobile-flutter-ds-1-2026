# Configuração do Ambiente

No Flutter para isntalação e configuração do Ambiente siga os seguintes passos:

# 1. Baixar o Flutter SDK

```text
🌐 Acesse: https://docs.flutter.dev/get-started/install/windows
📥 Baixe o arquivo: flutter_windows_XXX.zip
```
* Após baixar - descompacte a pasta

# 2. Organizar as pastas  

```text
📁 Criar estrutura organizada:
   C:\
   └── 📁 src\
       └── 📁 flutter\  (cole aqui a pasta descompactada)

💡 Por que C:\src? 
   - Evita problemas de permissão
   - Caminho curto e sem espaços
   - Fácil de lembrar e acessar
```

# 3.  Configurar Variáveis de Ambiente

```text
Windows + R → "sysdm.cpl" → Enter
→ Clique na guia - Avançado - Variáveis de Ambiente

Ou: Painel de Controle > Sistema > Configurações Avançadas > Variáveis de Ambiente

--- Selecione em Variáveis do Sistema PATH
---Clique em Editar 


1. Selecione "Path" e clique em "Editar"
2. Clique em "Novo"
3. Adicione: C:\src\flutter\bin
4. Clique em "Mover para Cima" até ficar no topo
5. OK em todas as janelas
```
> "O PATH é como uma lista de atalhos que o Windows consulta para encontrar programas. Colocar no topo garante que ele encontre nossa versão do Flutter primeiro."

# 4.  Reiniciar o Sistema
```text
Por que reiniciar?
   - Atualiza todas as variáveis de ambiente
   - Evita erros de "comando não encontrado"
   ```
# 5.  Configuração do Android Studio

Baixe o Android Studio e instale no seu computador. Em seguida siga os passos abaixo:

1. Abra o Android Studio
2. Clique em "More Actions" → "SDK Manager"
3. Ou: File > Settings > Appearance & Behavior > System Settings > Android SDK
4. Vá para a aba "SDK Tools"
5. Marque/Instale:
    * ✅ Android SDK Build-Tools
    * ✅ Android SDK Command-line Tools
    * ✅ Android SDK Platform-Tools
    * ✅ Android Emulator
    * ✅ Intel x86 Emulator Accelerator (HAXM installer)
6. Apply > OK > COMPONENTES SDK

# 6.  Verificr Instalações

Abra o Prompt de Comando ou PowerShell e execute:

```bash

# Verificar Flutter
flutter --version

# Diagnóstico completo
flutter doctor

# Se aparecer [X] Android licenses, execute:
flutter doctor --android-licenses
# Digite 'y' para aceitar todas as licenças

# Execute novamente para confirmar
flutter doctor
```

# 💻 Configuração do VS Code

## Instalar Extensões

1. Abra o VS Code
2. Clique no ícone de extensões (ou Ctrl+Shift+X)
3. Pesquise por: Flutter
4. Clique em instalar (instala automaticamente o Dart)
5. Reinicie o VS Code

# Teste Final

```bash
# Verificar Dart
dart --version

# Verificar Flutter novamente
flutter doctor

# Deverá mostrar algo como:
[√] Flutter (Channel stable, 3.x.x...)
[√] Windows Version
[√] Android toolchain
[√] VS Code
```

# Problemas Comuns e Soluções

1. Erro: `flutter' não é reconhecido...
```text
🔧 Solução: Variável de ambiente não configurada corretamente
   - Verifique se C:\src\flutter\bin está no PATH
   - Reinicie o terminal
```

2. Erro: Android licenses not accepted
```text
🔧 Solução: Executar flutter doctor --android-licenses
   - Digite 'y' para todas as perguntas
   - Execute novamente flutter doctor
```
3. Erro: Unable to find git in your PATH

```text
🔧 Solução: Instalar Git for Windows
   - Baixar de: git-scm.com
   - Instalar com opções padrão
```
# Comandos importante

```bash
# Criar primeiro projeto
flutter create meu_primeiro_app

# Entrar na pasta
cd meu_primeiro_app

# Abrir no VS Code
code .

# Executar o app
flutter run

# Comandos úteis durante execução:
# r - hot reload
# R - hot restart
# q - sair
```