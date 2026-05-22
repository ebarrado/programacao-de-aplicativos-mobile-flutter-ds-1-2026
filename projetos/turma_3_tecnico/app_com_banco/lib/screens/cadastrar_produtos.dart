import 'dart:io';

import 'package:app_com_banco/models/produto.dart';
import 'package:app_com_banco/service/produto_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class CadastrarProdutos extends StatefulWidget {
  const CadastrarProdutos({super.key});

  @override
  State<CadastrarProdutos> createState() =>
      _CadastrarProdutosState();
}

class _CadastrarProdutosState
    extends State<CadastrarProdutos> {

  // =====================================
  // FORM
  // =====================================

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>();

  // =====================================
  // CONTROLLERS
  // =====================================

  final TextEditingController
  _nomeController =
      TextEditingController();

  final TextEditingController
  _descricaoController =
      TextEditingController();

  final TextEditingController
  _quantidadeController =
      TextEditingController();

  final TextEditingController
  _valorController =
      TextEditingController();

  // =====================================
  // SERVICES
  // =====================================

  final ProdutoService _produtoService =
      ProdutoService();

  final ImagePicker _picker =
      ImagePicker();

  // =====================================
  // VARIAVEIS
  // =====================================

  File? _imagemSelecionada;

  bool _carregando = false;

  // =====================================
  // DISPOSE
  // =====================================

  @override
  void dispose() {

    _nomeController.dispose();

    _descricaoController.dispose();

    _quantidadeController.dispose();

    _valorController.dispose();

    super.dispose();
  }

  // =====================================
  // CAMERA
  // =====================================

  Future<void> _abrirCamera() async {

    final XFile? foto =
        await _picker.pickImage(

      source: ImageSource.camera,

      imageQuality: 70,
    );

    if (foto != null) {

      setState(() {

        _imagemSelecionada =
            File(foto.path);

      });
    }
  }

  // =====================================
  // GALERIA
  // =====================================

  Future<void> _abrirGaleria() async {

    final XFile? imagem =
        await _picker.pickImage(

      source: ImageSource.gallery,

      imageQuality: 70,
    );

    if (imagem != null) {

      setState(() {

        _imagemSelecionada =
            File(imagem.path);

      });
    }
  }

  // =====================================
  // REMOVER IMAGEM
  // =====================================

  void _removerImagem() {

    setState(() {

      _imagemSelecionada = null;

    });
  }

  // =====================================
  // UPLOAD AZURE
  // =====================================

  Future<String> uploadAzure(
    File imagem,
  ) async {

    final bytes =
        await imagem.readAsBytes();

    final nomeArquivo =
        "${DateTime.now().millisecondsSinceEpoch}.jpg";

    // =====================================
    // STORAGE
    // =====================================

    const storageUrl =
        "AQUI-COLA-URL-DA-CONTA-ARMAZENAMENTO https://NOMECONTADEARMAZENAMENTO.blob.core.windows.net";
    //NOME DO CONTAINER
    const container =
        "produtos";

    // =====================================
    // SAS TOKEN
    // =====================================

    const sasToken =
        "AQUI-COLE-A-CHAVE-SAS-URL-GERADA-A-PARTIR-DO-SP";

    // =====================================
    // URL FINAL
    // =====================================

    final url = Uri.parse(
      "$storageUrl/$container/$nomeArquivo?$sasToken",
    );

    final response =
        await http.put(

      url,

      headers: {

        "x-ms-blob-type":
            "BlockBlob",

        "Content-Type":
            "image/jpeg",
      },

      body: bytes,
    );

    debugPrint(
      "STATUS: ${response.statusCode}",
    );

    debugPrint(
      "BODY: ${response.body}",
    );

    if (response.statusCode == 201) {

      return
          "$storageUrl/$container/$nomeArquivo";
    }

    throw Exception(
      "Erro upload Azure",
    );
  }

  // =====================================
  // CADASTRAR PRODUTO
  // =====================================

  Future<void>
  _cadastrarProduto() async {

    if (!_formKey.currentState!
        .validate()) return;

    if (_imagemSelecionada == null) {

      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(

          content: Text(
            "Selecione uma imagem",
          ),

          backgroundColor:
              Colors.red,
        ),
      );

      return;
    }

    setState(() {

      _carregando = true;

    });

    try {

      // =====================================
      // UPLOAD IMAGEM AZURE
      // =====================================

      final imageUrl =
          await uploadAzure(
        _imagemSelecionada!,
      );

      // =====================================
      // CRIAR PRODUTO
      // =====================================

      final produto = Produto(

        nome:
            _nomeController.text
                .trim(),

        descricao:
            _descricaoController
                .text
                .trim(),

        quantidade: int.parse(
          _quantidadeController
              .text
              .trim(),
        ),

        valor: double.parse(

          _valorController.text

              .trim()

              .replaceAll(',', '.'),
        ),

        imagem: imageUrl,
      );

      // =====================================
      // SALVAR FIRESTORE
      // =====================================

      final erro =
          await _produtoService
              .cadastrarProduto(
        produto,
      );

      if (!mounted) return;

      if (erro == null) {

        ScaffoldMessenger.of(context)
            .showSnackBar(

          const SnackBar(

            content: Text(
              "Produto cadastrado com sucesso",
            ),

            backgroundColor:
                Colors.green,
          ),
        );

        _limparCampos();

      } else {

        ScaffoldMessenger.of(context)
            .showSnackBar(

          SnackBar(

            content: Text(erro),

            backgroundColor:
                Colors.red,
          ),
        );
      }

    } catch (e) {

      debugPrint(
        "ERRO: $e",
      );

      ScaffoldMessenger.of(context)
          .showSnackBar(

        SnackBar(

          content: Text(
            "Erro: $e",
          ),

          backgroundColor:
              Colors.red,
        ),
      );

    } finally {

      setState(() {

        _carregando = false;

      });
    }
  }

  // =====================================
  // LIMPAR CAMPOS
  // =====================================

  void _limparCampos() {

    _nomeController.clear();

    _descricaoController.clear();

    _quantidadeController.clear();

    _valorController.clear();

    setState(() {

      _imagemSelecionada = null;

    });
  }

  // =====================================
  // BUILD
  // =====================================

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "Cadastrar Produto",
        ),

        backgroundColor:
            const Color(
          0xff2c5364,
        ),

        foregroundColor:
            Colors.white,
      ),

      body: _carregando

          ? const Center(
              child:
                  CircularProgressIndicator(),
            )

          : SingleChildScrollView(

              padding:
                  const EdgeInsets
                      .all(16),

              child: Form(

                key: _formKey,

                child: Column(

                  children: [

                    // =====================================
                    // IMAGEM
                    // =====================================

                    _imagemSelecionada !=
                            null

                        ? Stack(

                            children: [

                              ClipRRect(

                                borderRadius:
                                    BorderRadius
                                        .circular(
                                            12),

                                child:
                                    Image.file(

                                  _imagemSelecionada!,

                                  height:
                                      220,

                                  width: double
                                      .infinity,

                                  fit: BoxFit
                                      .cover,
                                ),
                              ),

                              Positioned(

                                right: 10,

                                top: 10,

                                child:
                                    CircleAvatar(

                                  backgroundColor:
                                      Colors
                                          .black54,

                                  child:
                                      IconButton(

                                    onPressed:
                                        _removerImagem,

                                    icon:
                                        const Icon(
                                      Icons.close,
                                      color: Colors
                                          .white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )

                        : Container(

                            height: 220,

                            width: double
                                .infinity,

                            decoration:
                                BoxDecoration(

                              color: Colors
                                  .grey[300],

                              borderRadius:
                                  BorderRadius
                                      .circular(
                                          12),
                            ),

                            child:
                                const Center(

                              child: Icon(
                                Icons.image,
                                size: 80,
                              ),
                            ),
                          ),

                    const SizedBox(
                        height: 20),

                    // =====================================
                    // BOTOES IMAGEM
                    // =====================================

                    Row(

                      children: [

                        Expanded(

                          child:
                              ElevatedButton
                                  .icon(

                            style:
                                ElevatedButton
                                    .styleFrom(

                              backgroundColor:
                                  Colors.blue,
                            ),

                            onPressed:
                                _abrirCamera,

                            icon:
                                const Icon(
                              Icons
                                  .camera_alt,
                            ),

                            label:
                                const Text(
                              "Camera",
                            ),
                          ),
                        ),

                        const SizedBox(
                            width: 10),

                        Expanded(

                          child:
                              ElevatedButton
                                  .icon(

                            style:
                                ElevatedButton
                                    .styleFrom(

                              backgroundColor:
                                  Colors.orange,
                            ),

                            onPressed:
                                _abrirGaleria,

                            icon:
                                const Icon(
                              Icons.photo,
                            ),

                            label:
                                const Text(
                              "Galeria",
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                        height: 20),

                    // =====================================
                    // NOME
                    // =====================================

                    TextFormField(

                      controller:
                          _nomeController,

                      decoration:
                          InputDecoration(

                        labelText:
                            "Nome Produto",

                        prefixIcon:
                            const Icon(
                          Icons
                              .shopping_bag,
                        ),

                        border:
                            OutlineInputBorder(

                          borderRadius:
                              BorderRadius
                                  .circular(
                                      12),
                        ),
                      ),

                      validator:
                          (value) {

                        if (value ==
                                null ||
                            value
                                .isEmpty) {

                          return "Informe o nome";
                        }

                        return null;
                      },
                    ),

                    const SizedBox(
                        height: 20),

                    // =====================================
                    // DESCRICAO
                    // =====================================

                    TextFormField(

                      controller:
                          _descricaoController,

                      maxLines: 3,

                      decoration:
                          InputDecoration(

                        labelText:
                            "Descricao",

                        prefixIcon:
                            const Icon(
                          Icons
                              .description,
                        ),

                        border:
                            OutlineInputBorder(

                          borderRadius:
                              BorderRadius
                                  .circular(
                                      12),
                        ),
                      ),

                      validator:
                          (value) {

                        if (value ==
                                null ||
                            value
                                .isEmpty) {

                          return "Informe a descricao";
                        }

                        return null;
                      },
                    ),

                    const SizedBox(
                        height: 20),

                    // =====================================
                    // QUANTIDADE
                    // =====================================

                    TextFormField(

                      controller:
                          _quantidadeController,

                      keyboardType:
                          TextInputType
                              .number,

                      decoration:
                          InputDecoration(

                        labelText:
                            "Quantidade",

                        prefixIcon:
                            const Icon(
                          Icons.numbers,
                        ),

                        border:
                            OutlineInputBorder(

                          borderRadius:
                              BorderRadius
                                  .circular(
                                      12),
                        ),
                      ),

                      validator:
                          (value) {

                        if (value ==
                                null ||
                            value
                                .isEmpty) {

                          return "Informe a quantidade";
                        }

                        return null;
                      },
                    ),

                    const SizedBox(
                        height: 20),

                    // =====================================
                    // VALOR
                    // =====================================

                    TextFormField(

                      controller:
                          _valorController,

                      keyboardType:
                          TextInputType
                              .number,

                      decoration:
                          InputDecoration(

                        labelText:
                            "Valor",

                        prefixIcon:
                            const Icon(
                          Icons
                              .monetization_on,
                        ),

                        border:
                            OutlineInputBorder(

                          borderRadius:
                              BorderRadius
                                  .circular(
                                      12),
                        ),
                      ),

                      validator:
                          (value) {

                        if (value ==
                                null ||
                            value
                                .isEmpty) {

                          return "Informe o valor";
                        }

                        return null;
                      },
                    ),

                    const SizedBox(
                        height: 30),

                    // =====================================
                    // BOTAO
                    // =====================================

                    SizedBox(

                      width:
                          double.infinity,

                      height: 55,

                      child:
                          ElevatedButton(

                        style:
                            ElevatedButton
                                .styleFrom(

                          backgroundColor:
                              const Color(
                            0xff2c5364,
                          ),

                          foregroundColor:
                              Colors.white,
                        ),

                        onPressed:
                            _cadastrarProduto,

                        child:
                            const Text(

                          "Cadastrar Produto",

                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}