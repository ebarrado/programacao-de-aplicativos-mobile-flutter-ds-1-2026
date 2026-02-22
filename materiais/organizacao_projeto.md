# Organização do Projeto

## Estrutura

```text
lib/
├── main.dart
└── widget_stack.dart
```


Criando arquivo separado
Na pasta lib, crie um arquivo chamado widget_stack.dart:

## Arquivo `widget_stack.dart`

```dart
import 'package:flutter/material.dart';

class WidgetStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional(0.0, 0.0),
      children: [
        Container(color: Colors.blue, width: 400, height: 400),
        Container(color: Colors.yellow, width: 200, height: 200),
        Container(color: Colors.red, width: 80, height: 80),
        Container(color: Colors.green, width: 30, height: 30),
      ],
    );
  }
}
```

# No arquivo `main.dart`

```dart
Arquivo main.dart import 'package:flutter/material.dart';
import 'widget_stack.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Widgets Flutter'),
        ),
        body: WidgetStack(),
      ),
    )
  );
}
```

## Explicação

|Arquivo|Responsabilidade|
|----|----|
|widget_stack.dart |	Define o widget Stack com os containers coloridos|
|main.dart	| Configura o app e exibe o WidgetStack na tela|

# Criando uma tela de perfil

```text
lib/
├── main.dart
└── profile_screen.dart
``` 

## `lib/profile_screen.dart`

```dart
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Cabeçalho do perfil
      appBar: AppBar(
        title: Text('Meu Perfil'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),

      // Corpo do perfil
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Foto e estatísticas
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  // Foto de perfil (avatar)
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://randomuser.me/api/portraits/women/44.jpg',
                    ),
                  ),
                  SizedBox(width: 20),
                  
                  // Estatísticas
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStat('Posts', '42'),
                        _buildStat('Seguidores', '1.2k'),
                        _buildStat('Seguindo', '350'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Nome e bio
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ana Silva',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Desenvolvedora Flutter • Amante de tecnologia e café ☕',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'linktree.com/ana.silva',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 15),

            // Botões de ação
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        foregroundColor: Colors.white,
                      ),
                      child: Text('Editar Perfil'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.purple,
                      ),
                      child: Text('Compartilhar'),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Abas de conteúdo
            DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.grid_on)),
                      Tab(icon: Icon(Icons.video_library)),
                      Tab(icon: Icon(Icons.person_pin)),
                    ],
                    labelColor: Colors.purple,
                    unselectedLabelColor: Colors.grey,
                  ),
                  
                  Container(
                    height: 400,
                    child: TabBarView(
                      children: [
                        // Grid de posts
                        GridView.builder(
                          padding: EdgeInsets.all(5),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                          ),
                          itemCount: 9,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://picsum.photos/200/200?random=$index',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                        
                        // Posts em vídeo (simulado)
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.video_library, size: 50, color: Colors.grey),
                              Text('Nenhum vídeo ainda'),
                            ],
                          ),
                        ),
                        
                        // Marcados (simulado)
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.person_pin, size: 50, color: Colors.grey),
                              Text('Nenhuma marcação'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget auxiliar para estatísticas
  Widget _buildStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
```

## `lib/main.dart`

```dart
import 'package:flutter/material.dart';
import 'profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfil App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: ProfileScreen(),
    );
  }
}
```
## Widgets utilizados

| Conceito | Onde é usado |
|----------|--------------|
| **AppBar** | Cabeçalho com título e ícone de configurações |
| **CircleAvatar** | Foto de perfil redonda |
| **Row/Column** | Layout das estatísticas e botões |
| **Expanded** | Distribuição proporcional dos botões |
| **GridView** | Grade de fotos do perfil (3 colunas) |
| **TabBar/TabBarView** | Abas para alternar entre conteúdos |
| **NetworkImage** | Carregar imagens da internet |
| **SingleChildScrollView** | Permitir rolagem em telas longas |

# Atividade -  Card de Produto com  Stack

### Situação Problema 

Você é contratado por uma loja de roupas online para criar a tela de exibição de produtos. O gerente pediu um card de produto que destaque o desconto e mostre informações importantes de forma atraente.

1. Crie um card de produto para um e-commerce que exiba:

* Imagem do produto (ocupando toda área)

* Selo de "30% OFF" no canto superior esquerdo

* Ícone de coração (favorito) no canto superior direito

* Preço sobreposto no canto inferior esquerdo

* Nome do produto sobreposto no canto inferior direito

## Estrutura do Projeto

```text
lib/
├── main.dart
└── product_card.dart
```

## Tela Completa do App

```text
┌─────────────────────────────────┐
│ 🔍 Loja Virtual            🛒❤️ │ ← AppBar com ícones
├─────────────────────────────────┤
│  ✨ Destaques da Semana ✨      │
│                                 │
│  ┌─────────────────────────┐    │
│  │  🏷️ 30% OFF       ❤️    │    │
│  │                         │    │
│  │       [IMAGEM]          │    │
│  │                         │    │
│  │  R$ 199,90     👟 Tênis │    │
│  └─────────────────────────┘    │
│                                 │
│  Aproveite as ofertas!          │
│                                 │
│  [ 🏠 ] [ 🔍 ] [ 🛒 ] [ 👤 ]   │ ← BottomNavigationBar
└─────────────────────────────────┘
````





