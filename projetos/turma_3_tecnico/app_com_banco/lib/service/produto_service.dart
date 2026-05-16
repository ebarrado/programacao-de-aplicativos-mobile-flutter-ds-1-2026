import 'package:app_com_banco/models/produto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProdutoService {

  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  final String _colecao = "produtos";

  // =========================
  // CADASTRAR PRODUTO
  // =========================
  Future<String?> cadastrarProduto(
    Produto produto,
  ) async {

    try {

      await _firestore
          .collection(_colecao)
          .add({

        ...produto.toMap(),

        "createdAt": Timestamp.now(),
      });

      return null;

    } catch (e) {

      debugPrint(
        "ERRO AO CADASTRAR: $e",
      );

      return "Erro ao cadastrar produto";
    }
  }

  // =========================
  // LISTAR PRODUTOS
  // =========================



  Stream<List<Produto>> listarProdutos() {

    return _firestore
        .collection(_colecao)
        .snapshots()
        .map((snapshot) {

      return snapshot.docs.map((doc) {

        final data = doc.data();

        return Produto.fromMap(
          data,
          doc.id,
        );

      }).toList();
    });
  }


  // =========================
  // ATUALIZAR PRODUTO
  // =========================
  Future<void> atualizarProduto(
    Produto produto,
  ) async {

    try {

      await _firestore
          .collection(_colecao)
          .doc(produto.id)
          .update({

        ...produto.toMap(),

        "updatedAt": Timestamp.now(),
      });

    } catch (e) {

      debugPrint(
        "ERRO AO ATUALIZAR: $e",
      );

      rethrow;
    }
  }

  // =========================
  // DELETAR PRODUTO
  // =========================
  Future<void> deletarProduto(
    String id,
  ) async {

    try {

      await _firestore
          .collection(_colecao)
          .doc(id)
          .delete();

    } catch (e) {

      debugPrint(
        "ERRO AO DELETAR: $e",
      );

      rethrow;
    }
  }
}