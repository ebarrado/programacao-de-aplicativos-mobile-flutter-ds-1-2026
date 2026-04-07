import 'package:cloud_firestore/cloud_firestore.dart';

class ProdutoService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> salvarProduto({
    required String nome,
    required String descricao,
    required int quantidade,
    required double valor,
    required String imagem,
  }) async {
    await _db.collection('produtos').add({
      'nome': nome,
      'descricao': descricao,
      'quantidade': quantidade,
      'valor': valor,
      'imagem': imagem,
      'criadoEm': FieldValue.serverTimestamp(),
    });
  }
  static Stream<QuerySnapshot<Map<String, dynamic>>> listarProdutos() {
    return _db.collection('produtos').snapshots();
 
  }

  
}


