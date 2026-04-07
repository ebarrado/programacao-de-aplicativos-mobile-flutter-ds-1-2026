# 🛒 TechStore - App Flutter com Firebase

Aplicativo mobile desenvolvido em Flutter para gerenciamento de produtos, com integração em tempo real utilizando Firebase (Cloud Firestore).


## 📱 Funcionalidades

* 📋 Listagem de produtos em tempo real
* ➕ Cadastro de produtos
* 🖼️ Exibição de imagens por URL
* 🔥 Integração com Firebase
* 🎨 Interface moderna (Material Design)



## 🖥️ Telas do App

### 🏠 Tela Inicial (Home)

* Destaques de produtos
* Campo de busca
* Cards promocionais
* Navegação inferior


### 📦 Tela de Produtos

* Lista dinâmica com `StreamBuilder`
* Atualização automática em tempo real
* Exibição de:

  * Nome
  * Descrição
  * Quantidade
  * Valor
  * Imagem


### ➕ Tela de Cadastro de Produto

* Formulário completo com validação
* Campos disponíveis:

  * Nome do produto
  * Descrição
  * Quantidade
  * Valor
  * URL da imagem
* Botão de salvar integrado ao Firebase



## 🚀 Tecnologias Utilizadas

* Flutter
* Dart
* Firebase Core
* Cloud Firestore


## 📂 Estrutura do Projeto

```id="y2t7pb"
lib/
│
├── screen/
│   ├── produto_screen.dart
│   ├── cadastro_produto_screen.dart
│
├── services/
│   └── produto_service.dart
│
├── widgets/
│   └── produto_widget.dart
│
├── main.dart
└── firebase_options.dart
```

## 🔥 Integração com Firebase

### Inicialização

```dart id="q9g2k8"
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
```

### Salvando Produto

```dart id="sd8k2p"
await _db.collection('produtos').add({
  'nome': nome,
  'descricao': descricao,
  'quantidade': quantidade,
  'valor': valor,
  'imagem': imagem,
  'criadoEm': FieldValue.serverTimestamp(),
});
```

### Listando Produtos em Tempo Real

```dart id="7z6rme"
_db.collection('produtos').snapshots();
```


## 🧠 Estrutura no Firestore

```id="lqg1sv"
produtos/
   id_auto/
      nome: "Notebook"
      descricao: "Notebook Gamer"
      quantidade: 5
      valor: 3500.00
      imagem: "https://..."
      criadoEm: Timestamp
```

## ▶️ Como Executar

```bash id="f2r0jh"
flutter pub get
flutter run
```
---

## ⚠️ Problemas Comuns

### ❌ Produto não aparece

Se estiver usando:

```dart id="6xtn23"
.orderBy('criadoEm')
```

Todos os documentos precisam ter:

```id="e4cnfp"
criadoEm: Timestamp
```

### ❌ Imagem não aparece

* Use:

```dart id="c72f91"
Image.network(url)
```

* Verifique se a URL é válida
* Teste no navegador



### ❌ Erro de Internet (Android)

```xml id="tn5u1o"
<uses-permission android:name="android.permission.INTERNET"/>
```

## 🧩 Exemplo de Cadastro

```dart id="s3p1lk"
await ProdutoService.salvarProduto(
  nome: 'Smartphone',
  descricao: '128GB - 8GB RAM',
  quantidade: 10,
  valor: 1999.90,
  imagem: 'https://...',
);
```

## 📡 Atualização em Tempo Real

A tela de produtos usa `StreamBuilder`, garantindo que qualquer alteração no Firebase seja refletida automaticamente na interface.



## 🎯 Melhorias Futuras

* ✏️ Editar produtos
* 🗑️ Excluir produtos
* 🔍 Busca por nome
* 🛒 Carrinho de compras
* ❤️ Favoritos

## Demo



## 👨‍💻 Autor

Projeto desenvolvido com Flutter 🚀


## 📄 Licença

Uso educacional
