# 🎨 Widgets Flutter

## 📌 O que são Widgets?

**Widgets** são componentes visuais utilizados para definir a interface de um aplicativo Flutter.

> 💡 **Pense nos widgets como blocos de construção** - cada parte visual do seu app é um widget!

## 📊 Categorias de Widgets

### 1️⃣ Widgets de Layout
São responsáveis por **determinar a organização e posicionamento** de outros widgets. Delimitam áreas na tela que serão preenchidas por outros componentes.

### 2️⃣ Widgets de Interface
São responsáveis por **criar componentes visuais** que serão exibidos para os usuários. Determinam os elementos que comporão a interface.


## Widgets de Layout

### Scaffold
Widget que cria um layout "padrão" para o app, contendo:
- `appBar` (barra superior)
- `body` (conteúdo principal da tela)

### Stack
Widget responsável por **"empilhar" widgets** na tela, do topo ao final da interface (sobreposição).

### Container
Widget utilizado para **comportar outros widgets**, permitindo:
- Bordas
- Margens
- Preenchimentos
- Tamanhos personalizados

## 🎯 Widgets de Interface

Criam componentes visuais que serão incorporados aos widgets de layout.

**Exemplos comuns:**
- Botões
- Labels (textos)
- Ícones
- Campos de texto
- Imagens

### 🎨 Conjuntos de Estilização

| Conjunto | Descrição |
|----------|-----------|
| **Material** | Estiliza widgets seguindo os padrões do **Material Design** (Google) |
| **Cupertino** | Estiliza widgets seguindo os padrões de design do **iOS** (Apple) |


## 🔗 Exemplo de Hierarquia

```text
MaterialApp
└── Scaffold
├── AppBar
└── Body
└── Stack
├── Container (Vermelho)
├── Container (Azul)
└── Container (Verde)
```


---

## 🚀 Mão na Massa - Primeiro Projeto

### 1️⃣ Criar o projeto

No terminal ou prompt de comando:

```bash
flutter create exemplo_01
```
### 2️⃣ Abrir no VS Code

```bash
cd exemplo_01
code .
```

## ou Criar o projeto direto no VS Code

1. No VS Code pressione **CTRL + SHIFT + P**
2. Clique em **Flutter: New Project**
3. Selecione **Aplication**
4. Selecione uma pasta que deseja colcoar seu projeto
5. Coloque um nome no projeto e pressione `Enter`
6. Aguarde o projeto ser criado

###  3️⃣ Preparar o arquivo principal
No arquivo lib/main.dart, apague todo o código existente e deixe apenas a estrutura básica:

```dart
void main() {
  runApp(
    
  );
}
```
## 📦 Widget Container

### Estrutura Básica

```dart
void main() {
  runApp(
    Container(
      color: Colors.blue,
      width: 200,
      height: 200,
    )
  );
}
```
## ⚠️ Importante!

> O Container não permite colocar um elemento na frente do outro. Widgets ficarão um sobreposto ao outro:

```dart
// Isso NÃO funcionará como esperado - um container ficará sobre o outro
void main() {
  runApp(
    Container(
      color: Colors.blue,
      width: 200,
      height: 200,
    ),
    Container(
      color: Colors.red,
      width: 100,
      height: 100,
    )
  );
}
```

### ⌨️ Atalho útil

> CTRL + ALT + L: Identa (organiza) o código automaticamente

## 📚 Widget Stack

O Stack permite sobrepor vários widgets, ordenando-os de baixo para cima:

```dart
void main() {
  runApp(
    Stack(
      children: [
        Container(
          color: Colors.blue,
          width: 200,
          height: 200,
        ),
        Container(
          color: Colors.red,
          width: 100,
          height: 100,
        ),
      ],
    )
  );
}
```
