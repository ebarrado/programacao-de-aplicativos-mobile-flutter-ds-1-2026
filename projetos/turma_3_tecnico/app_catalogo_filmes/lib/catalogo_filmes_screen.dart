import 'package:flutter/material.dart';

class CatalogoFilmeScreen extends StatefulWidget {
  const CatalogoFilmeScreen({super.key});

  @override
  State<CatalogoFilmeScreen> createState() => _CatalogoFilmeScreenState();
}

class _CatalogoFilmeScreenState extends State<CatalogoFilmeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catálogo de Filmes",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: "Arial",
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 17, 17, 17),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart, color: Colors.white),
          ),
        ],
        leading: Icon(Icons.menu, color: Colors.white),
      ),
      body: Padding(     
         padding: const EdgeInsets.all(8),

        child: Column(
          children: [
            // FILME 1
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              color: const Color.fromARGB(255, 221, 220, 218),

              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset(
                      "implacavel.jpg",
                      height: 100,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Nome do Filme",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 5),

                          Text(
                            "Implacável (Avengement, 2019), estrelado por Scott Adkins.",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(Icons.arrow_right),
                  ),
                ],
              ),
            ),

            // FILME 2
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              color: const Color.fromARGB(255, 221, 220, 218),

              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset(
                      "liam_neeson.jpg",
                      height: 100,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Outro Filme",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 5),

                          Text(
                            "Descrição do segundo filme.",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(Icons.arrow_right),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
