import 'package:flutter/material.dart';

//Criar componente Produto
class ProdutoWidget extends StatelessWidget {
  final String nome;
  final String descricao;
  final int quantidade;
  final double valor;
  final String imagem;


  //construtor da classe

  const ProdutoWidget({
    super.key, 
    required this.nome, 
    required this.descricao,
    required this.quantidade,
    required this.valor,
    required this.imagem});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 231, 230, 228),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(nome,
                     style: TextStyle(
                        color: Color.fromARGB(255, 10, 62, 97),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    descricao,
                     style: TextStyle(
                        fontSize: 12,
                      ),
                  ),
                ),
                SizedBox(height: 16),
                //Classificação
                Row(
                  children: [
                    Icon(Icons.star, color: const Color.fromARGB(255, 236, 213, 5)),
                    Icon(Icons.star, color: const Color.fromARGB(255, 236, 213, 5)),
                    Icon(Icons.star, color: const Color.fromARGB(255, 236, 213, 5)),
                    Icon(Icons.star),
                    Icon(Icons.star),
                  ],
                ),
                SizedBox(height: 16,),
                //Informações
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [Icon(Icons.attach_money), Text(
                          "R\$ ${valor.toStringAsFixed(2)}"
                          )],
                      ),
                      Column(
                        children: [
                          Icon(Icons.production_quantity_limits),
                          Text("Qtd: $quantidade"),
                        ],
                      ),
                      Column(
                        children: [Icon(Icons.shopping_cart), Text("Comprar")],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Flexible(
            child:Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,        
                 children: [Image.asset(
                    imagem,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ]),
            ))
         
        ],
      )
    );
  }
}
