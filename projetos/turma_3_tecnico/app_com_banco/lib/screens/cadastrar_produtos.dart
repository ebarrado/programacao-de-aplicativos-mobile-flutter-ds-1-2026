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
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),

                child: Row(
                  children: [

                    // ÍCONE
                    Container(
                      padding: const EdgeInsets.all(12),

                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),

                        borderRadius:
                            BorderRadius.circular(15),
                      ),

                     child: IconButton(
                        onPressed: () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        icon: Icon(Icons.shopping_bag),
                        color: Colors.white,
                        iconSize: 30,
                       
                      ),
                    ),

                    const SizedBox(width: 15),

                    // TEXTO
                    const Expanded(
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,

                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [

                          Text(
                            "Cadastrar Produtos",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight:
                                  FontWeight.bold,
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
      body: _carregando
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Icon(Icons.inventory_2, size: 70, color:const Color.fromARGB(255, 40, 68, 73),),
                        const SizedBox(height: 10),
                        const Text(
                          "Preencha os dados do Produto",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _nomeController,
                          decoration: InputDecoration(
                            labelText: "Nome Produto",
                            hintText: "Exemplo: Notebook Gamer",
                            prefixIcon: const Icon(Icons.shopping_bag),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Informe o nome do produto";
                            }
                            if (value.trim().length < 3) {
                              return "O nome do produto deve ter mais de 3 caracteres";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _descricaoController,
                          decoration: InputDecoration(
                            labelText: "Descrição do Produto",
                            hintText: "Exemplo: Notebook com 16GB RAM",
                            prefixIcon: const Icon(Icons.description),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Informe a descrição do produto";
                            }
                            if (value.trim().length < 3) {
                              return "A descrição do produto deve ter mais de 3 caracteres";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _quantidadeController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "QTD Produto",
                            hintText: "Exemplo: 10",
                            prefixIcon: const Icon(Icons.numbers),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Informe a quantidade de produtos";
                            }
                            if (int.tryParse(value.trim()) == null) {
                              return "Informe um número válido";
                            }
                            if (int.parse(value.trim()) < 1) {
                              return "A quantidade deve ser pelo menos 1";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _valorController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Valor do Produto",
                            hintText: "Exemplo: 3500,90",
                            prefixIcon: const Icon(Icons.monetization_on),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Informe o valor do produto";
                            }
                            final valorStr = value.trim().replaceAll(',', '.');
                            if (double.tryParse(valorStr) == null) {
                              return "Informe um valor válido";
                            }
                            if (double.parse(valorStr) < 0.01) {
                              return "O valor do produto deve ser maior que 0";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _imagemController,
                          decoration: InputDecoration(
                            labelText: "Imagem do Produto",
                            hintText: "Exemplo: URL da imagem",
                            prefixIcon: const Icon(Icons.image),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Informe a URL da imagem do produto";
                            }
                            if (value.trim().length < 3) {
                              return "A URL do produto deve ter mais de 3 caracteres";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 40, 68, 73),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: _cadastrarProduto,
                          child: const Text(
                            "Cadastrar",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}