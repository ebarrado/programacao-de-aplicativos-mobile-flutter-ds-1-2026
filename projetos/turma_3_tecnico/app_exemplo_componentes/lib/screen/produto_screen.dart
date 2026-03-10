//importe Material
import 'package:flutter/material.dart';

//class - statells - statefull
//comdando na ide - stl

class ProdutoScreen extends StatefulWidget {
  const ProdutoScreen({super.key});

  @override
  State<ProdutoScreen> createState() => _ProdutoScreenState();
}

class _ProdutoScreenState extends State<ProdutoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Criar Produto",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: "Arial",
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 181, 245, 6),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Notebook 15.6",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 10, 62, 97),
                      fontFamily: "Arial",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Notebook, Windows 11 Home, Tela 15,6 Pol HD, Celeron N4020C, Memória 4GB/128GB, Microsoft 365, Ultra - UB261",
                    style: TextStyle(
                      fontFamily: "Verdana",
                      fontSize: 14,
                      fontWeight: FontWeight.w100
                    ),
                  ),
                  Row(
                    children: [
                    Column(children: [
                          Icon(Icons.star, color: Colors.green[500]),
                          Icon(Icons.star, color: Colors.green[500]),
                          Icon(Icons.star, color: Colors.green[500]),
                          Icon(Icons.star, color: Colors.black),
                          Icon(Icons.star, color: Colors.black),
                        ],
                      ),
                      Text("Classificação"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Icon(Icons.attach_money),
                            Text("R\$ 290,99"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Icon(Icons.production_quantity_limits),
                            Text("Qtd: 10"),
                          ],
                        ),
                      ),
                      Column(
                        children: [Icon(Icons.shopping_cart), Text("Comprar")],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: 350,
                height: 200,
                color: Colors.amber,
                child: Image.asset("notebook.jpg", fit: BoxFit.contain),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
