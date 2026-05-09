import 'package:app_com_banco/models/produto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProdutoService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final String _colecao = "......";

  //Cadastrar Produtos

  Future<String>  cadastrarProduto(Produto produto) async{
    try{
      await _firestore
      .collection(_colecao)
      .add(produto.toMap());
    
      return "Cadastrado com Sucesso";
    }
    catch (e){
      return
      "Erro ao Cadastrar Produto $e";
    }
  }
}