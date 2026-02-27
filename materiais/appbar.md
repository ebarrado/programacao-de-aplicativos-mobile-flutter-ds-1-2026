# AppBar no Flutter

O `AppBar` é um componente amplamente utilizado no Flutter para criar barras de aplicativos (app bars) que geralmente contêm títulos, botões de ação e outros widgets. Ele é parte do widget `Scaffold` e é usado para fornecer uma interface consistente e funcional para o usuário.

## Estrutura Básica

Abaixo está um exemplo básico de como usar o `AppBar` no Flutter:

```dart
import 'package:flutter/material.dart';

void main() {
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            home: Scaffold(
                appBar: AppBar(
                    title: Text('Exemplo de AppBar'),
                    backgroundColor: Colors.blue,
                ),
                body: Center(
                    child: Text('Conteúdo principal'),
                ),
            ),
        );
    }
}
```

## Propriedades Comuns

- **title**: Define o título exibido na barra.
- **backgroundColor**: Define a cor de fundo da barra.
- **actions**: Lista de widgets (geralmente ícones ou botões) exibidos no lado direito da barra.
- **leading**: Widget exibido no lado esquerdo da barra, como um botão de menu ou ícone de navegação.
- **elevation**: Define a elevação (sombra) da barra.

## Exemplo com Ações

```dart
appBar: AppBar(
    title: Text('AppBar com Ações'),
    actions: [
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
                // Ação ao pressionar o botão de busca
            },
        ),
        IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
                // Ação ao pressionar o botão de menu
            },
        ),
    ],
),
```

## Personalização Avançada

O `AppBar` pode ser altamente personalizado para atender às necessidades do design do aplicativo. Por exemplo, você pode usar widgets personalizados no lugar do título ou adicionar imagens de fundo.

```dart
appBar: AppBar(
    title: Row(
        children: [
            Icon(Icons.star),
            SizedBox(width: 10),
            Text('AppBar Personalizada'),
        ],
    ),
    flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
            ),
        ),
    ),
),
```

## Exemplo com Navegação

O `Navigator` é o responsável por controlar a navegação entre telas em um aplicativo Flutter.

Ele funciona como um gerenciador de rotas, permitindo:

* Ir para uma nova tela
* Voltar para a tela anterior
* Substituir telas
* Limpar o histórico de navegação

O Navigator trabalha com o conceito de pilha (Stack).

### 📦 Imagine uma pilha de pratos:

O último prato colocado é o primeiro a ser removido.

Cada tela do app é colocada em cima dessa pilha.

Antes da navegação:
```dart
HomeScreen
```

Após `Navigator.push`

```text
HomeScreen
ContatoScreen
```
## Métodos do `Navigator.push()
Adiciona uma nova tela na pilha.
```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ContatoScreen(),
  ),
);
```
#### Empilha uma nova rota.
O `Navigator não navega diretamente para um Widget.

Ele trabalha com `Route (Rotas)`

* Mais utilizada é `MaterialPageRoute`

Ela define:

* A animação de transição

* O comportamento da navegação

* O widget que será exibido

## Exemplo na `AppBar`

```dart
appBar: AppBar(
        title: Text(
          "AppBar",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: "Arial",
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 43, 170, 170),
        actions: [
          IconButton(
            tooltip: 'Próxima Página',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContatoScreen()),
              );
            },
            icon: Icon(Icons.navigate_next),
          ),
          IconButton(
            tooltip: 'Pesquisar',
            onPressed: () {
              print("Botão Pressionado");
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            tooltip: 'Menu Popup',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Esta é uma mensagem padronizada'),
                ),
              );
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
```

## Tooltip no AppBar (Flutter)

Tooltip é uma pequena mensagem que aparece quando o usuário:
* Mantém o dedo pressionado (no celular)
* Passa o mouse por cima (na Web/Desktop)
* Ela serve para explicar a função de um botão ou ícone.

### Exemplo

```dart
AppBar(
  title: Text("Minha Tela"),
  actions: [
    IconButton(
      tooltip: "Ir para próxima página",
      icon: Icon(Icons.navigate_next),
      onPressed: () {},
    )
  ],
)
```

## Mostrar Mensagem na Tela

`ScaffoldMessenger.of(context).showSnackBar()`, esse comando é usado para mostrar uma mensagem temporária na parte inferior da tela, chamada SnackBar.

## O que é SnackBar?

SnackBar é uma pequena mensagem que:
* Aparece na parte inferior da tela
* Fica visível por alguns segundos
* Desaparece automaticamente
* Serve para dar feedback ao usuário

#### Exemplo:
```text
“Salvo com sucesso”

“Erro ao conectar”

“Item removido”

```

```dart
ScaffoldMessenger.of(context).showSnackBar(
  const SnackBar(
    content: Text('Esta é uma mensagem padronizada'),
  ),
);
```

### ScaffoldMessenger

É o responsável por gerenciar SnackBars e mensagens visuais dentro do Scaffold.

Antes do Flutter 2, usava-se Scaffold.of(context), mas agora o correto é ScaffoldMessenger.

### .of(context)

O context serve para localizar qual Scaffold está ativo na tela.

Ele diz:

* “Mostre essa mensagem dentro da tela atual.”

### .showSnackBar()

Método que manda exibir a SnackBar.

## Exemplo
```dart
ElevatedButton(
  onPressed: () {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Mensagem exibida com sucesso!'),
      ),
    );
  },
  child: Text('Mostrar mensagem'),
)
```
## Conclusão

O `AppBar` é um componente essencial para criar interfaces de usuário no Flutter. Ele oferece flexibilidade e personalização para atender às necessidades de qualquer aplicativo. Explore as propriedades e widgets disponíveis para criar barras de aplicativos únicas e funcionais.



Para mais informações, consulte a [documentação oficial do Flutter](https://api.flutter.dev/flutter/material/AppBar-class.html).