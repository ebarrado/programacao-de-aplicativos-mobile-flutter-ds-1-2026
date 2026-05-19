# Consumo de API no Flutter

Consumir APIs no Flutter é uma das tarefas mais comuns no desenvolvimento mobile. Normalmente, o aplicativo faz requisições HTTP para um backend REST, recebe dados em JSON e transforma esses dados em objetos Dart.

## Fluxo básico

O fluxo geralmente funciona assim:

1. O app envia uma requisição HTTP
2. A API responde com JSON
3. O Flutter converte o JSON em objetos Dart
4. A interface exibe os dados

## Dependência necessária

A forma mais simples é usando o package
```yaml
dependencies:
  http: ^1.2.1
```

- Depois

```bash
flutter pub get
```
## Exemplo de API

Vamos usar esta API pública:

```json
https://jsonplaceholder.typicode.com/posts
```
Ela retorna algo assim:

```json
[
  {
    "userId": 1,
    "id": 1,
    "title": "Título",
    "body": "Conteúdo"
  }
]
```
## Estrutura recomendada

Uma estrutura simples e organizada:

```text
lib/
├── models/
│   └── post_model.dart
├── services/
│   └── api_service.dart
├── pages/
│   └── home_page.dart
└── main.dart
```

# Exemplo

## Criando o Model
- `post_model.dart`
```dart
class PostModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
```

## Criando o Service

-`api_service.dart`

```dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

class ApiService {
  static const String url =
      'https://jsonplaceholder.typicode.com/posts';

  static Future<List<PostModel>> fetchPosts() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);

      return jsonData
          .map((json) => PostModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Erro ao carregar posts');
    }
  }
}
```
## Consumindo na Interface
- `home_page.dart`

```dart
import 'package:flutter/material.dart';
import '../models/post_model.dart';
import '../services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<PostModel>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = ApiService.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consumo de API'),
      ),
      body: FutureBuilder<List<PostModel>>(
        future: futurePosts,
        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          final posts = snapshot.data!;

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];

              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
```

## Main
- `main.dart`
```dart
import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
```
## HTTP Methods

As APIs REST usam métodos diferentes:

| Método | Função             |
| ------ | ------------------ |
| GET    | Buscar dados       |
| POST   | Criar dados        |
| PUT    | Atualizar completo |
| PATCH  | Atualizar parcial  |
| DELETE | Remover dados      |

# OMDb API?

A OMDb API (Open Movie Database API) é uma API REST usada para consultar informações sobre:

* Filmes
* Séries
* Episódios
* Atores
* Avaliações
* Posters
* Dados do IMDb

Ela é muito utilizada em projetos Flutter para aprendizado de:

* Consumo de APIs
* Busca dinâmica
* JSON parsing
* Catálogos de filmes
* Infinite scroll
* Integração com interfaces visuais

## Exemplo de uso

Uma requisição simples:

```text
https://www.omdbapi.com/?t=Batman&apikey=SUA_CHAVE
```

#### Ela retorna algo assim:

```json
{
  "Title": "Batman",
  "Year": "1989",
  "Rated": "PG-13",
  "Released": "23 Jun 1989",
  "Runtime": "126 min",
  "Genre": "Action, Adventure",
  "Director": "Tim Burton",
  "Actors": "Michael Keaton, Jack Nicholson",
  "Plot": "The Dark Knight of Gotham City...",
  "Language": "English",
  "Country": "USA",
  "Poster": "https://....jpg",
  "imdbRating": "7.5"
}
```
# Criando uma chave API

Para usar a API você precisa gerar uma chave gratuita:

* Acesse: [OMDb API Key Page](https://www.omdbapi.com/apikey.aspx)

* Escolha o plano Free
* Informe email
* Receba a chave

> Ao receber o e-mail ative sua chave e utilize o que estiver após a **apikey=SUACHAVE**

## Principais parâmetros

| Parâmetro | Função                   |
| --------- | ------------------------ |
| `t`       | Busca por título exato   |
| `s`       | Busca por lista          |
| `i`       | Busca pelo IMDb ID       |
| `y`       | Filtrar por ano          |
| `type`    | movie, series ou episode |
| `page`    | Paginação                |
| `apikey`  | Sua chave                |

```text
https://www.omdbapi.com/?t=Interstellar&apikey=KEY
https://www.omdbapi.com/?s=Batman&apikey=KEY
https://www.omdbapi.com/?i=tt0816692&apikey=KEY
```


