# Criando um projeto com Stack

1. CTRL + SHIFT + P (abre a paleta de comandos)

2 . Clique em New Project → Application

3. Selecione a pasta para o projeto

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

* (-1.0, -1.0) : Canto superior esquerdo

* (0.0, 0.0) : Centro

* (1.0, 1.0) : Canto inferior direito

## ✍️ ATIVIDADE PRÁTICA

Desafio: Criar containers coloridos com Stack
Crie os seguintes containers dentro de um Stack:

| 🎨 Container | 🌈 Cor    | 📏 Tamanho |
|--------------|-----------|------------|
| 1º           | 🔵 Azul   | 400px      |
| 2º           | 💛 Amarelo| 200px      |
| 3º           | ❤️ Vermelho| 80px      |
| 4º           | 💚 Verde   | 30px      |

