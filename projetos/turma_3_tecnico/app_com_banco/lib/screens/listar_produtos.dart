import 'package:app_com_banco/models/produto.dart';
import 'package:app_com_banco/service/produto_service.dart';
import 'package:flutter/material.dart';

class ListarProdutos extends StatelessWidget {
  const ListarProdutos({super.key});

  @override
  Widget build(BuildContext context) {
    final ProdutoService produtoService = ProdutoService();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),

        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,

          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff0f2027),
                  Color(0xff203a43),
                  Color(0xff2c5364),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),

              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),

            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),

                child: Row(
                  children: [
                    // ÍCONE
                    Container(
                      padding: const EdgeInsets.all(12),

                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),

                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: IconButton(
                        onPressed: () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        icon: Icon(Icons.shopping_bag),
                        color: Colors.white,
                        iconSize: 28,
                       
                      ),
                    ),

                    const SizedBox(width: 15),

                    // TEXTO
                    const Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            "Listar Produto",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 4),

                          Text(
                            "Sua loja de tecnologia",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // BOTÕES
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},

                          icon: const Icon(
                            Icons.notifications_none,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),

                        IconButton(
                          onPressed: () {},

                          icon: const Icon(
                            Icons.person_outline,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

      body: StreamBuilder<List<Produto>>(
        stream: produtoService.listarProdutos(),

        builder: (context, snapshot) {
          // LOADING
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // ERRO
          if (snapshot.hasError) {
            return Center(child: Text("Erro: ${snapshot.error}"));
          }

          final produtos = snapshot.data ?? [];

          // LISTA VAZIA
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
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      // IMAGEM
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

                              child: const Icon(Icons.image, size: 40),
                            );
                          },
                        ),
                      ),

                      const SizedBox(width: 15),

                      // DADOS
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

                            Text(produto.descricao),

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
                                color: const Color.fromARGB(255, 40, 68, 73),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 15),

                            // BOTÕES
                            Row(
                              children: [
                                // EDITAR
                                Expanded(
                                  child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orange,
                                      foregroundColor: Colors.white,
                                    ),

                                    onPressed: () {
                                      _abrirModalEditar(
                                        context,
                                        produto,
                                        produtoService,
                                      );
                                    },

                                    icon: const Icon(Icons.edit),

                                    label: const Text("Editar"),
                                  ),
                                ),

                                const SizedBox(width: 10),

                                // EXCLUIR
                                Expanded(
                                  child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      foregroundColor: Colors.white,
                                    ),

                                    onPressed: () async {
                                      final confirmar = await showDialog<bool>(
                                        context: context,

                                        builder: (_) {
                                          return AlertDialog(
                                            title: const Text(
                                              "Excluir Produto",
                                            ),

                                            content: const Text(
                                              "Deseja realmente excluir este produto?",
                                            ),

                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context, false);
                                                },

                                                child: const Text("Cancelar"),
                                              ),

                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.red,
                                                  foregroundColor: Colors.white,
                                                ),

                                                onPressed: () {
                                                  Navigator.pop(context, true);
                                                },

                                                child: const Text("Excluir"),
                                              ),
                                            ],
                                          );
                                        },
                                      );

                                      if (confirmar == true) {
                                        await produtoService.deletarProduto(
                                          produto.id!,
                                        );

                                        if (!context.mounted) return;

                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              "Produto excluído com sucesso",
                                            ),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      }
                                    },

                                    icon: const Icon(Icons.delete),

                                    label: const Text("Excluir"),
                                  ),
                                ),
                              ],
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

  // MODAL EDITAR
  void _abrirModalEditar(
    BuildContext context,
    Produto produto,
    ProdutoService produtoService,
  ) {
    final nomeController = TextEditingController(text: produto.nome);

    final descricaoController = TextEditingController(text: produto.descricao);

    final quantidadeController = TextEditingController(
      text: produto.quantidade.toString(),
    );

    final valorController = TextEditingController(
      text: produto.valor.toString(),
    );

    final imagemController = TextEditingController(text: produto.imagem);

    showModalBottomSheet(
      context: context,

      isScrollControlled: true,

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),

      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 20,

            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),

          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                const Text(
                  "Editar Produto",

                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                // NOME
                TextField(
                  controller: nomeController,

                  decoration: const InputDecoration(
                    labelText: "Nome",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                // DESCRIÇÃO
                TextField(
                  controller: descricaoController,

                  decoration: const InputDecoration(
                    labelText: "Descrição",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                // QUANTIDADE
                TextField(
                  controller: quantidadeController,

                  keyboardType: TextInputType.number,

                  decoration: const InputDecoration(
                    labelText: "Quantidade",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                // VALOR
                TextField(
                  controller: valorController,

                  keyboardType: TextInputType.number,

                  decoration: const InputDecoration(
                    labelText: "Valor",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                // IMAGEM
                TextField(
                  controller: imagemController,

                  decoration: const InputDecoration(
                    labelText: "Imagem",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 50,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:const Color.fromARGB(255, 40, 68, 73),
                      foregroundColor: Colors.white,
                    ),

                    onPressed: () async {
                      try {
                        if (produto.id == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("ID inválido"),
                              backgroundColor: Colors.red,
                            ),
                          );

                          return;
                        }

                        final produtoAtualizado = Produto(
                          id: produto.id,

                          nome: nomeController.text.trim(),

                          descricao: descricaoController.text.trim(),

                          quantidade:
                              int.tryParse(quantidadeController.text.trim()) ??
                              0,

                          valor:
                              double.tryParse(
                                valorController.text.trim().replaceAll(
                                  ',',
                                  '.',
                                ),
                              ) ??
                              0.0,

                          imagem: imagemController.text.trim(),
                        );

                        await produtoService.atualizarProduto(
                          produtoAtualizado,
                        );

                        if (!context.mounted) return;

                        Navigator.pop(context);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Produto atualizado com sucesso"),
                            backgroundColor: const Color.fromARGB(255, 40, 68, 73),
                          ),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Erro ao atualizar: $e"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },

                    child: const Text("Salvar Alterações"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
