# Organização do Projeto

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