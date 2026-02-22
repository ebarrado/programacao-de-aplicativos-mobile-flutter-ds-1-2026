# Trabalhando com Stack no Flutter

## Objetivo

* Compreender profundamente o funcionamento do widget Stack
* Dominar o sistema de coordenadas e alinhamentos
* Aprender a combinar Stack com outros widgets
* Desenvolver interfaces complexas com sobreposição
* Criar efeitos visuais profissionais

# O que é Stack?

O Stack é um widget de layout que sobrepõe múltiplos widgets filhos, permitindo criar camadas visuais. Diferente de Row (horizontal) e Column (vertical), o Stack posiciona os elementos uns sobre os outros.

## Quando usar Stack?

* 📸 Imagens com texto sobreposto (ex: perfil de usuário)
* 🎨 Badges e notificações sobre ícones
* 🖼️ Efeitos de profundidade e sombras
* 🔘 Botões flutuantes sobre conteúdo
* 🎯 Animações com camadas sobrepostas

## Criando um Projeto com Stack

1. Para criar um novo projeto no VS Code pressione CTRL + SHIFT + P (abre a paleta de comandos), para criar um novo projeto flutter


2. Clique em New Project → Application

3. Selecione a pasta para o projeto

4. Adicione um nome ao projeto 

5. Apague o conteúdo do `main.dart`

```dart
void main() {
  runApp(
    Stack(
      children: [
        Container(
          color: Colors.blue,
          width: 400,    // Aumentamos o tamanho
          height: 400,
        ),
        Container(
          color: Colors.red,
          width: 200,    // Aumentamos o tamanho
          height: 200,
        ),
      ],
    )
  );
}
```
Podemos trabalhar com o Layout `Scaffold` adicionando appbar e um body à tela

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exemplo de Stack'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Stack(
            children: [
              // Primeiro elemento (base)
              Container(
                width: 300,
                height: 300,
                color: Colors.blue.withOpacity(0.3),
              ),
              
              // Segundo elemento (meio)
              Container(
                width: 200,
                height: 200,
                color: Colors.red.withOpacity(0.5),
              ),
              
              // Terceiro elemento (topo)
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    )
  );
}
```

## Alinhamento no Stack

O Stack possui a propriedade alignment para posicionar os elementos:

```dart
Stack(
  alignment: AlignmentDirectional(0.0, 0.0), // Centro
  children: [
    // widgets aqui
  ],
)
```

### Coordenadas:


| Coordenada (x, y) | Posição               |
|-------------------|----------------------|
| (-1.0, -1.0)      | Canto superior esquerdo |
| (0.0, -1.0)       | Centro superior      |
| (1.0, -1.0)       | Canto superior direito |
| (-1.0, 0.0)       | Centro esquerdo      |
| (0.0, 0.0)        | Centro absoluto      |
| (1.0, 0.0)        | Centro direito       |
| (-1.0, 1.0)       | Canto inferior esquerdo |
| (0.0, 1.0)        | Centro inferior      |
| (1.0, 1.0)        | Canto inferior direito |



## Exemplo prático com diferentes alinhamentos

```dart
Stack(
  children: [
    // Container base
    Container(
      width: 300,
      height: 300,
      color: Colors.grey[300],
    ),
    
    // Posicionamento específico com Positioned
    Positioned(
      top: 20,
      left: 20,
      child: Container(
        width: 80,
        height: 80,
        color: Colors.red,
      ),
    ),
    
    Positioned(
      bottom: 30,
      right: 30,
      child: Container(
        width: 60,
        height: 60,
        color: Colors.blue,
      ),
    ),
    
    Positioned(
      top: 100,
      right: 50,
      child: Container(
        width: 50,
        height: 50,
        color: Colors.green,
      ),
    ),
  ],
)
```

## Trabalhando com `POSITIONED`

### Parâmetros do Positioned

| Parâmetro | Descrição |
|-----------|-----------|
| `top`     | Distância do topo |
| `bottom`  | Distância do fundo |
| `left`    | Distância da esquerda |
| `right`   | Distância da direita |
| `width`   | Largura fixa |
| `height`  | Altura fixa |


## Criando uma interface com múltiplos elementos posicionados

```dart
Stack(
  children: [
    // Imagem de fundo
    Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://picsum.photos/400/300'),
          fit: BoxFit.cover,
        ),
      ),
    ),
    
    // Gradiente sobreposto (efeito escurecido)
    Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, Colors.black54],
        ),
      ),
    ),
    
    // Título posicionado
    Positioned(
      bottom: 50,
      left: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Título do Card',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Subtítulo ou descrição',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    ),
    
    // Badge posicionado no canto superior direito
    Positioned(
      top: 20,
      right: 20,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          'NEW',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
    
    // Avatar circular sobreposto
    Positioned(
      top: 250,
      right: 20,
      child: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage('https://picsum.photos/60/60'),
        backgroundColor: Colors.white,
      ),
    ),
  ],
)
```

# Exemplos:

## Card de Produto com sele de desconto

```dart
Container(
  width: 200,
  child: Stack(
    children: [
      // Imagem do produto
      Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage('https://picsum.photos/200/200'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      
      // Selo de desconto
      Positioned(
        top: 10,
        left: 10,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            '-30%',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      
      // Ícone de favorito
      Positioned(
        top: 10,
        right: 10,
        child: Icon(
          Icons.favorite_border,
          color: Colors.white,
          size: 28,
        ),
      ),
      
      // Informações do produto
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Produto Incrível',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'R\$ 99,90',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
)
```

##  Tela de perfil com efeitos

```dart
Stack(
  children: [
    // Cabeçalho com gradiente
    Container(
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    ),
    
    // Avatar centralizado
    Positioned(
      top: 150,
      left: 0,
      right: 0,
      child: Center(
        child: CircleAvatar(
          radius: 50,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 46,
            backgroundImage: NetworkImage('https://picsum.photos/100/100'),
          ),
        ),
      ),
    ),
    
    // Nome do usuário
    Positioned(
      top: 260,
      left: 0,
      right: 0,
      child: Center(
        child: Column(
          children: [
            Text(
              'João Silva',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Desenvolvedor Mobile',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    ),
    
    // Botão de editar
    Positioned(
      top: 40,
      right: 20,
      child: CircleAvatar(
        backgroundColor: Colors.white.withOpacity(0.3),
        child: IconButton(
          icon: Icon(Icons.edit, color: Colors.white),
          onPressed: () {},
        ),
      ),
    ),
  ],
)
```


## ✍️ Atividade Prática

Desafio: Crie um Stack com 4 containers coloridos seguindo a tabela abaixo, todos centralizados:

| 🎨 Container | 🌈 Cor    | 📏 Tamanho |
|--------------|-----------|------------|
| 1º           | 🔵 Azul   | 400px      |
| 2º           | 💛 Amarelo| 200px      |
| 3º           | ❤️ Vermelho| 80px      |
| 4º           | 💚 Verde   | 30px      |

