import 'package:app_com_banco/models/produto.dart';
import 'package:app_com_banco/service/produto_service.dart';
import 'package:flutter/material.dart';

class CadastrarProdutos extends StatefulWidget {
  const CadastrarProdutos({super.key});

  @override
  State<CadastrarProdutos> createState() => _CadastrarProdutosState();
}

class _CadastrarProdutosState extends State<CadastrarProdutos> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _quantidadeController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();
  final TextEditingController _imagemController = TextEditingController();

  final ProdutoService _produtoService = ProdutoService();

  bool _carregando = false;

  @override
  void dispose() {
    _nomeController.dispose();
    _descricaoController.dispose();
    _quantidadeController.dispose();
    _valorController.dispose();
    _imagemController.dispose();
    super.dispose();
  }

  Future<void> _cadastrarProduto() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _carregando = true;
    });

    final produto = Produto(
      nome: _nomeController.text.trim(),
      descricao: _descricaoController.text.trim(),
      quantidade: int.parse(_quantidadeController.text.trim()),
      valor: double.parse(_valorController.text.trim().replaceAll(',', '.')),
      imagem: _imagemController.text.trim(),
    );

    final erro = await _produtoService.cadastrarProduto(produto);

    if (!mounted) return;

    if (erro == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Produto Cadastrado com sucesso'),
          backgroundColor: Colors.green,
        ),
      );
      _limparCampos();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(erro), backgroundColor: Colors.red),
      );
    }
    setState(() {
      _carregando = false;
    });
  }

  // Função Limpar Campos

  void _limparCampos() {
    _nomeController.clear();
    _descricaoController.clear();
    _quantidadeController.clear();
    _valorController.clear();
    _imagemController.clear();
  }

  InputDecoration _buildInputDecoration({
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cadastrar Produto",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 21, 129, 129),
        foregroundColor: Color.fromARGB(255, 139, 137, 137),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Icon(Icons.inventory_2, size: 70, color: Colors.red),
                ],
              ),
            ),
          ),
        ),      
      ),
    );
  }
}
