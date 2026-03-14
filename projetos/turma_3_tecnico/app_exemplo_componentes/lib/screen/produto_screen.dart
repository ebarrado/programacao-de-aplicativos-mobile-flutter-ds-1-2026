//importe Material
import 'package:app_exemplo_componentes/widgets/produto_widget.dart';
import 'package:flutter/material.dart';

//class - statells - statefull
//comdando na ide - stl

class ProdutoScreen extends StatefulWidget {
  const ProdutoScreen({super.key});

  @override
  State<ProdutoScreen> createState() => _ProdutoScreenState();
}

class _ProdutoScreenState extends State<ProdutoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Criar Produto",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: "Arial",
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 181, 245, 6),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ProdutoWidget(
                nome: "Notebook 15.6",
                descricao: "Notebook, Windows 11 Home, Tela 15,6 Pol HD, Celeron N4020C, Memória 4GB/128GB, Microsoft 365, Ultra - UB261",
                quantidade: 20,
                valor: 3500.89,
                imagem: "notebook.jpg",
                ),
              SizedBox(height: 10),
              ProdutoWidget(
                nome:"Mochila Masculina Impermeáve",
                descricao: "Mochila Escolar Universitária Sport Resistente. Compartimento para Notebook 15/16 POL.Ideal para: Faculdade, Escola, Trabalho, Viagens.",
                quantidade: 10,
                valor: 250.99 ,
                imagem: "mochila.jpg",
                ),
              SizedBox(height: 10),
              ProdutoWidget(
                nome:"Computador PC Gamer Completo TOB Intel Core i5 SSD 480GB 16GB ",
                descricao: "Computador completo com componentes e especificações técnicas superiores à concorrência. Máquina com custo-benefício imbatível.",
                quantidade: 5,
                valor: 8980.98,
                imagem: "pc_game.jpg",),
              SizedBox(height: 10),
              ProdutoWidget(
                nome:"Impressora Multifuncional EcoTank L3250 Wi-Fi Epson",
                descricao: "A Epson EcoTank L3250 é uma impressora multifuncional tanque de tinta 3 em 1 com conexão wireless destinada à famílias, estudantes, e profissionais. Oferece baixo custo de impressão graças ao sistema de EcoTank, que imprime até 4.500 páginas em preto e 7.500 páginas coloridas com cada kit de garrafas de reposição original.",
                quantidade: 30,
                valor: 1258.85,
                imagem: "impressora.jpg",),
              SizedBox(height: 10),
              ProdutoWidget(
                nome:"Repetidor de Sinal Wifi 2800m 4 Antenas",
                descricao: "Aumente o alcance do seu Wi-Fi utilizando o Repetidor de Sinal Wi-Fi e obtenha uma rede rápida e segura. A velocidade de transmissão é de até 600Mbps e em conformidade com o padrão IEEE 802.11n. Seu wi-fi distribuí o sinal para toda a casa ou escritório",
                quantidade: 2,
                valor: 650.00,
                imagem: "repetidor.jpg",),
            ],
          ),
        ),
      ),
    );
  }
}
