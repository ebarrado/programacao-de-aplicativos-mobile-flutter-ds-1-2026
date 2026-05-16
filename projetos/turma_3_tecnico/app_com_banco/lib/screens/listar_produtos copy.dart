import 'package:app_com_banco/models/produto.dart';
import 'package:app_com_banco/service/produto_service.dart';
import 'package:flutter/material.dart';

class ListarProdutos extends StatelessWidget {
  const ListarProdutos({super.key});

  @override
  Widget build(BuildContext context) {
    final ProdutoService produtoService = ProdutoService();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lista de Produtos",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: StreamBuilder<List<Produto>>(
        stream: produtoService.listarProdutos(),
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Erro: ${snapshot.error}",
              ),
            );
          }

          final produtos = snapshot.data ?? [];

          if (produtos.isEmpty) {
            return const Center(
              child: Text(
                "Nenhum produto cadastrado",
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            itemCount: produtos.length,
            itemBuilder: (context, index) {

              final produto = produtos[index];

              return Card(
                margin: const EdgeInsets.all(12),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [

                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          produto.imagem,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,

                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 100,
                              height: 100,
                              color: Colors.grey[300],
                              child: const Icon(Icons.image),
                            );
                          },
                        ),
                      ),

                      const SizedBox(width: 15),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              produto.nome,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              produto.descricao,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),

                            const SizedBox(height: 8),

                            Text(
                              "Quantidade: ${produto.quantidade}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              "R\$ ${produto.valor.toStringAsFixed(2)}",
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}