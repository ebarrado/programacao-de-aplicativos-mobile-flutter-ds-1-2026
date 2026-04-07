import 'package:app_exemplo_componentes/screen/cadastro_produto_screen.dart';
import 'package:app_exemplo_componentes/services/produto_service.dart';
import 'package:app_exemplo_componentes/widgets/produto_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProdutoScreen extends StatelessWidget {
  const ProdutoScreen({super.key});

  int _toInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }

  double _toDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is int) return value.toDouble();
    if (value is double) return value;
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Produtos',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Arial',
          ),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            tooltip: 'Cadastrar produto',
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CadastroProdutoScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: ProdutoService.listarProdutos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao carregar produtos: ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('Nenhum produto cadastrado'),
            );
          }

          final produtos = snapshot.data!.docs;

          return ListView.separated(
            padding: const EdgeInsets.all(6),
            itemCount: produtos.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final doc = produtos[index];
              final produto = doc.data();

              final String nome = produto['nome']?.toString() ?? '';
              final String descricao = produto['descricao']?.toString() ?? '';
              final int quantidade = _toInt(produto['quantidade']);
              final double valor = _toDouble(produto['valor']);
              final String imagem = produto['imagem']?.toString() ?? '';

              return ProdutoWidget(
                nome: nome,
                descricao: descricao,
                quantidade: quantidade,
                valor: valor,
                imagem: imagem,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CadastroProdutoScreen(),
            ),
          );
        },
      ),
    );
  }
}