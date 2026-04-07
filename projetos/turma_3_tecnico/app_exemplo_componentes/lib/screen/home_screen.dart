//importe Material
import 'package:app_exemplo_componentes/screen/cadastro_produto_screen.dart';
import 'package:app_exemplo_componentes/screen/produto_screen.dart';
import 'package:app_exemplo_componentes/widgets/banner_widget.dart';
import 'package:flutter/material.dart';

//class - statells - statefull
//comdando na ide - stl

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TechStore",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: "Arial",
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 5, 5, 5),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        actions: [
          IconButton(
            tooltip: 'CadastrarProduto',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CadastroProdutoScreen()),
              );
            },
            icon: Icon(Icons.add_box),
          ),
          IconButton(
            tooltip: 'Pesquisar',
            onPressed: () {
              print("Botão Pressionado");
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            tooltip: 'Menu Popup',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Esta é uma mensagem padronizada'),
                ),
              );
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      //body
      //----///
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.black,
              padding: EdgeInsets.fromLTRB(20, 10, 20, 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bem-vindo à TechStore",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 1),
                  Text(
                    "Os melhores produtos de tecnologia em um só lugar",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  SizedBox(height: 18),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Pesquisar produtos...",
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff0f2027),
                      Color(0xff203a43),
                      Color(0xff2c5364),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  //Utilizado para efeito de sombra dentro do BoxDecoration
                  boxShadow: [
                    BoxShadow(color: Colors.black26, offset: Offset(0, 4)),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Super Oferta",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Notebook Gamer\n com até 30% OFF",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(height: 20),
                            Flexible(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                              
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ProdutoScreen(),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      foregroundColor: Colors.white,
                                    ),
                                    child: const Text("Comprar Agora"),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // 🔹 ESPAÇO ENTRE TEXTO E ÍCONE
                      SizedBox(width: 10),

                      // 🔹 LADO DIREITO (ÍCONE)
                      Flexible(
                        flex: 1,
                        child: Icon(
                          Icons.laptop_mac,
                          size: 90,
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                ),
                /* Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Super Oferta",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Notebook Gamer\n com até 30% OFF",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(height: 14),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProdutoScreen(),
                                  ),
                                );
                              },
                              child: Text("Comprar Agora"),
                            ),
                            Expanded(
                              child: Icon(
                                Icons.laptop_mac,
                                size: 90,
                                color: Colors.amber,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),*/
              ),
            ),

            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Center(
                        child: Text(
                          "BBB22",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Center(
                        child: Text(
                          "BBB22",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Center(
                        child: Text(
                          "BBB22",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Center(
                        child: Text(
                          "BBB22",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Center(
                        child: Text(
                          "BBB22",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Center(
                        child: Text(
                          "BBB22",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Center(
                        child: Text(
                          "BBB22",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            BannerWidget(
              titulo: 'Promoção Relâmpago',
              descricao: 'Smartphones com desconto especial',
              textoBotao: 'Ver Ofertas',
              icone: Icons.smartphone,
              onPressed: () {},
            ),
          ],
        ),
      ),
      //BottomNavigatonBar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        selectedItemColor: const Color.fromARGB(255, 170, 4, 4),
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal_rounded),
            label: 'Configuração',
          ),
        ],
      ),
    );
  }
}
