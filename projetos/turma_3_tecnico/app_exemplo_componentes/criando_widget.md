# Criando Widget (componentização)

No Flutter, tudo é Widget.

## O que é componentização?

Componentização é quando você quebra a interface em partes menores (widgets).

👉 Em vez de fazer tudo dentro de uma tela só (HomeScreen), você separa em componentes.

## Vantagens da componentização

### Antes

A HomeScreen ficava com muita responsabilidade:

* appBar
* busca
* banner
* lista horizontal
* navegação inferior

#### Problema

```python
Container(
  child: Column(
    children: [
      Text("Super Oferta"),
      Text("Notebook Gamer"),
      ElevatedButton(...)
    ],
  ),
)
```
* Código muito grande
* Difícil manutenção
* Não reutilizável


### Depois

Ao criar um widget componentizado você transforma esse bloco em um componente:

Cada parte fica separada:

* HomeScreen organiza a tela
* BannerWidget cuida só do banner

```python
Column(
  children: [
    BannerWidget(
      titulo: 'Super Oferta',
      descricao: 'Notebook Gamer\ncom até 30% OFF',
      textoBotao: 'Comprar Agora',
      icone: Icons.laptop_mac,
      onPressed: () {},
    ),
    const SizedBox(height: 16),
    BannerWidget(
      titulo: 'Promoção Relâmpago',
      descricao: 'Smartphones com desconto especial',
      textoBotao: 'Ver Ofertas',
      icone: Icons.smartphone,
      onPressed: () {},
    ),
  ],
)
```

### Isso melhora:

* leitura do código
* manutenção
* reutilização
* organização do projeto