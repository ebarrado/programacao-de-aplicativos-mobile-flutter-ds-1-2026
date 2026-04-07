import 'package:app_exemplo_componentes/services/produto_service.dart';
import 'package:flutter/material.dart';

class CadastroProdutoScreen extends StatefulWidget {
  const CadastroProdutoScreen({super.key});

  @override
  State<CadastroProdutoScreen> createState() => _CadastroProdutoScreenState();
}

class _CadastroProdutoScreenState extends State<CadastroProdutoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _quantidadeController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();
  final TextEditingController _imagemController = TextEditingController();

  bool _salvando = false;

  Future<void> _salvar() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _salvando = true;
    });

    try {
      await ProdutoService.salvarProduto(
        nome: _nomeController.text.trim(),
        descricao: _descricaoController.text.trim(),
        quantidade: int.parse(_quantidadeController.text.trim()),
        valor: double.parse(_valorController.text.trim().replaceAll(',', '.')),
        imagem: _imagemController.text.trim(),
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Produto salvo com sucesso'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao salvar produto: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _salvando = false;
        });
      }
    }
  }

  InputDecoration _inputDecoration({
    required String label,
    required IconData icon,
    String? hint,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _descricaoController.dispose();
    _quantidadeController.dispose();
    _valorController.dispose();
    _imagemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cadastro de Produto',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
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
                  const Icon(
                    Icons.inventory_2,
                    size: 70,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Preencha os dados do produto',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _nomeController,
                    decoration: _inputDecoration(
                      label: 'Nome do produto',
                      icon: Icons.shopping_bag,
                      hint: 'Ex: Notebook Gamer',
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Informe o nome do produto';
                      }
                      if (value.trim().length < 3) {
                        return 'O nome deve ter pelo menos 3 caracteres';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _descricaoController,
                    maxLines: 4,
                    decoration: _inputDecoration(
                      label: 'Descrição',
                      icon: Icons.description,
                      hint: 'Digite a descrição do produto',
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Informe a descrição do produto';
                      }
                      if (value.trim().length < 10) {
                        return 'A descrição deve ter pelo menos 10 caracteres';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _quantidadeController,
                    keyboardType: TextInputType.number,
                    decoration: _inputDecoration(
                      label: 'Quantidade',
                      icon: Icons.format_list_numbered,
                      hint: 'Ex: 10',
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Informe a quantidade';
                      }
                      final int? quantidade = int.tryParse(value.trim());
                      if (quantidade == null) {
                        return 'Digite um número inteiro válido';
                      }
                      if (quantidade < 0) {
                        return 'A quantidade não pode ser negativa';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _valorController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: _inputDecoration(
                      label: 'Valor',
                      icon: Icons.attach_money,
                      hint: 'Ex: 3500.90',
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Informe o valor do produto';
                      }
                      final String valorFormatado =
                          value.trim().replaceAll(',', '.');
                      final double? valor = double.tryParse(valorFormatado);
                      if (valor == null) {
                        return 'Digite um valor válido';
                      }
                      if (valor <= 0) {
                        return 'O valor deve ser maior que zero';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _imagemController,
                    decoration: _inputDecoration(
                      label: 'Nome da imagem',
                      icon: Icons.image,
                      hint: 'Ex: notebook.jpg',
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Informe o nome da imagem';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: _salvando ? null : _salvar,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: _salvando
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Icon(Icons.save),
                      label: Text(
                        _salvando ? 'Salvando...' : 'Salvar Produto',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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