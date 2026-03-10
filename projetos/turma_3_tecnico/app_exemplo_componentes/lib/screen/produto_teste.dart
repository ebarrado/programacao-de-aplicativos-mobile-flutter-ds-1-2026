import 'package:flutter/material.dart';

class ProdutoScrenTeste extends StatefulWidget {
  const ProdutoScrenTeste({super.key});

  @override
  State<ProdutoScrenTeste> createState() => _ProdutoScrenTesteState();
}

class _ProdutoScrenTesteState extends State<ProdutoScrenTeste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Criar Produto",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 181, 245, 6),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// TEXTO DO PRODUTO
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Notebook 15.6",
                    style: TextStyle(
                      color: Color.fromARGB(255, 10, 62, 97),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Notebook Windows 11 Home, Tela 15,6 Pol HD, "
                    "Celeron N4020C, Memória 4GB/128GB, Microsoft 365, Ultra UB261",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 15),

                  /// CLASSIFICAÇÃO
                  Row(
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.star, color: Colors.green),
                          Icon(Icons.star, color: Colors.green),
                          Icon(Icons.star, color: Colors.green),
                          Icon(Icons.star, color: Colors.black),
                          Icon(Icons.star, color: Colors.black),
                        ],
                      ),
                      const SizedBox(width: 10),
                      const Text("Classificação"),
                    ],
                  ),

                  const SizedBox(height: 25),

                  /// INFORMAÇÕES
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Column(
                        children: const [
                          Icon(Icons.attach_money),
                          Text("R\$ 290,99"),
                        ],
                      ),

                      Column(
                        children: const [
                          Icon(Icons.production_quantity_limits),
                          Text("Qtd: 10"),
                        ],
                      ),

                      Column(
                        children: const [
                          Icon(Icons.shopping_cart),
                          Text("Comprar"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            /// IMAGEM
            Expanded(
              flex: 1,
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  "notebook.jpg",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}