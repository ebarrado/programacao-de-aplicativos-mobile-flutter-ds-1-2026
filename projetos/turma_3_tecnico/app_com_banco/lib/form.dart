import 'package:flutter/material.dart';

class CadastrarProdutos extends StatefulWidget {
  const CadastrarProdutos({super.key});

  @override
  State<CadastrarProdutos> createState() => _CadastrarProdutosState();
}

class _CadastrarProdutosState extends State<CadastrarProdutos> {
  //variaveis - quando está com _(underline) é porque está numa classe com estado
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _quantidadeController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();
  final TextEditingController _imagemController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Produto",
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
        ),
        backgroundColor: Color(0xFF00CED1),
        foregroundColor: Color.fromARGB(255, 255, 253, 254),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18)
          ),
          child: Padding(padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Icon(
                Icons.inventory_2,
                size: 70,
                color: Colors.red,
                ),
                const SizedBox(height: 10,),
                const Text(
                  "Preencha os dados do Produto",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold
                  ),
                ),

                const SizedBox(height: 20,),
                TextFormField(
                  controller: _nomeController,
                  decoration: InputDecoration(
                    labelText: "Nome Produto",
                    hintText: "Exemplo: Notebook Gamer",
                    prefixIcon: Icon(Icons.shopping_bag),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                    )
                  ),
                  validator: (value){
                    if (value == null || value.trim().isEmpty){
                      return "Informe o nome do produto";
                    }
                    if (value.trim().length < 3){
                      return "O nome do produto deve ter mais de 3 caracteres";
                    }
                    return null;
                  },
                ),


                const SizedBox(height: 20,),
                TextFormField(
                  controller: _descricaoController,
                  decoration: InputDecoration(
                    labelText: "Descrição do Produto",
                    hintText: "Exemplo: Notebook com 16GB RAM",
                    prefixIcon: Icon(Icons.description),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                    )
                  ),
                  validator: (value){
                    if (value == null || value.trim().isEmpty){
                      return "Informe a descrição do produto";
                    }
                    if (value.trim().length < 3){
                      return "A descrição do produto deve ter mais de 3 caracteres";
                    }
                    return null;
                  },
                ),


                const SizedBox(height: 20,),
                TextFormField(
                  controller: _quantidadeController,
                  decoration: InputDecoration(
                    labelText: "QTD Produto",
                    hintText: "Exemplo: 10",
                    prefixIcon: Icon(Icons.numbers),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                    )
                  ),
                  validator: (value){
                    if (value == null || value.trim().isEmpty){
                      return "Informe a quantidade de produtos";
                    }
                    if (value.trim().length < 1){
                      return "A quantidade deve pelo menos de 1";
                    }
                    return null;
                  },
                ),


                const SizedBox(height: 20,),
                TextFormField(
                  controller: _valorController,
                  decoration: InputDecoration(
                    labelText: "Valor do Produto",
                    hintText: "Exemplo: 3500,90",
                    prefixIcon: Icon(Icons.monetization_on),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                    )
                  ),
                  validator: (value){
                    if (value == null || value.trim().isEmpty){
                      return "Informe o valor do produto";
                    }
                    if (value.trim().length < 1){
                      return "O valor do produto deve ter maior que 1";
                    }
                    return null;
                  },
                ),


                const SizedBox(height: 20,),
                TextFormField(
                  controller: _imagemController,
                  decoration: InputDecoration(
                    labelText: "Imagem do Produto",
                    hintText: "Exemplo: URL da imagem",
                    prefixIcon: Icon(Icons.image),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                    )
                  ),
                  validator: (value){
                    if (value == null || value.trim().isEmpty){
                      return "Informe a URL da imagem do produto";
                    }
                    if (value.trim().length < 3){
                      return "A URL do produto deve ter mais de 3 caracteres";
                    }
                    return null;
                  },
                ),


                SizedBox(height: 16,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: (){
                    print(_nomeController);
                },
                child:
                Text("Cadastrar"),
                )

              ],

          )
          ),
          ),
        ),
      ),
    );
  }
}