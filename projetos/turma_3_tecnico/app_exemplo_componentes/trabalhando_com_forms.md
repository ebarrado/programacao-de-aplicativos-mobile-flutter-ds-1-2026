# Forms

Criar nova tela chamada CadastroProdutoScreen com um Form para cadastrar:

* nome
* descrição
* quantidade
* valor
* imagem

## O que é Form

O Form é um widget que agrupa vários campos de entrada (inputs).

```dart
Form(
  key: _formKey,
  child: Column(
    children: [],
  ),
)
```

Form usa um chave `GlobalKey` para acessar seus dados

```dart
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
```

## Validação 

Para validar utilizamos:

```dart
if (_formKey.currentState!.validate()) {
  // tudo válido
}
```

## TextFormField
Campo de entrada de texto com validação integrada.

```dart
TextFormField(
  decoration: InputDecoration(labelText: "Nome"),
)
```

### Propriedades `TextFormField`

1. controller

* Controla o valor digitado
```dart
controller: _nomeController,
```
2. decoration

* Define aparência do campo

```dart
decoration: InputDecoration(
  labelText: "Nome",
  prefixIcon: Icon(Icons.person),
),
```
3. validator

* Valida o campo

```dart
validator: (value) {
  if (value == null || value.isEmpty) {
    return 'Campo obrigatório';
  }
  return null;
},
```
4. keyboardType

* Tipo de teclado

```dart
keyboardType: TextInputType.number,
```
> “O TextFormField é utilizado para capturar dados do usuário e permite validação automática através da propriedade validator.”

## TextEditingController
Controla o texto digitado no campo.

```dart
final TextEditingController _nomeController = TextEditingController();
``` 

* Pegar o valor digitado
* Limpar campo
* Alterar valor programaticamente

```dart
String nome = _nomeController.text;
```

## Validator
Função que valida o campo.
```dart
validator: (value) {
  if (value == null || value.isEmpty) {
    return 'Informe o nome';
  }
  return null;
},
```
* Retorna String → erro
* Retorna null → válido

> O validator é responsável por validar os dados inseridos e retornar mensagens de erro caso necessário

## ScaffoldMessenger (SnackBar)
Mostra mensagens na tela.

```dart
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(content: Text("Salvo com sucesso")),
);
```
## ElevatedButton

Botão com ação.

```dart
ElevatedButton(
  onPressed: () {},
  child: Text("Salvar"),
)
```
### Com validação

```dart
onPressed: () {
  if (_formKey.currentState!.validate()) {
    // salvar
  }
},
```
## InputDecoration

Define o visual do campo.

```dart
InputDecoration(
  labelText: "Nome",
  prefixIcon: Icon(Icons.person),
)
```
### Elementos

* labelText → título
* hintText → dica
* prefixIcon → ícone
* border → borda

>O InputDecoration é utilizado para estilizar os campos do formulário

| Componente     | Função           |
| -------------- | ---------------- |
| Form           | Agrupa e valida  |
| TextFormField  | Entrada de dados |
| Controller     | Controla texto   |
| Validator      | Validação        |
| ElevatedButton | Ação             |
| SnackBar       | Feedback         |
| Column         | Layout           |
| ScrollView     | Rolagem          |
