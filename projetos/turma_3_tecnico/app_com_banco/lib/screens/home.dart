import 'package:app_com_banco/screens/cadastrar_produtos.dart';
import 'package:app_com_banco/screens/listar_produtos.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      // APPBAR PERSONALIZADA
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

                      child: const Icon(
                        Icons.shopping_bag,
                        color: Colors.white,
                        size: 30,
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
                            "Meu Ecommerce",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
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

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

              // HEADER
              Container(
                width: double.infinity,

                padding: const EdgeInsets.fromLTRB(
                  20,
                  20,
                  20,
                  25,
                ),

                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius:
                      BorderRadius.circular(20),
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    const Text(
                      "Bem-vindo à TechStore",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      "Os melhores produtos de tecnologia em um só lugar",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius:
                            BorderRadius.circular(14),
                      ),

                      child: const TextField(
                        decoration: InputDecoration(
                          hintText:
                              "Pesquisar produtos...",

                          prefixIcon:
                              Icon(Icons.search),

                          border: InputBorder.none,

                          contentPadding:
                              EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // CARD PROMOCIONAL
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(18),

                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff0f2027),
                      Color(0xff203a43),
                      Color(0xff2c5364),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),

                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 4),
                      blurRadius: 8,
                    ),
                  ],
                ),

                child: Row(
                  children: [

                    // TEXTO
                    Expanded(
                      flex: 2,

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        mainAxisSize:
                            MainAxisSize.min,

                        children: [

                          const Text(
                            "Super Oferta",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 10),

                          const Text(
                            "Notebook Gamer\ncom até 30% OFF",

                            maxLines: 2,

                            overflow:
                                TextOverflow.ellipsis,

                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 20),

                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const CadastrarProdutos(),
                                ),
                              );
                            },

                            style:
                                ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.red,

                              foregroundColor:
                                  Colors.white,
                            ),

                            child: const Text(
                              "Comprar Agora",
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 10),

                    // ÍCONE
                    const Flexible(
                      flex: 1,

                      child: FittedBox(
                        fit: BoxFit.contain,

                        child: Icon(
                          Icons.laptop_mac,
                          size: 90,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // CARD PRINCIPAL
              Container(
                width: double.infinity,
                height: 180,

                decoration: BoxDecoration(
                  color: Colors.teal,

                  borderRadius:
                      BorderRadius.circular(20),
                ),

                child: const Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,

                  children: [

                    Icon(
                      Icons.shopping_cart,
                      size: 70,
                      color: Colors.white,
                    ),

                    SizedBox(height: 15),

                    Text(
                      "Sistema Ecommerce",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Gerencie seus produtos",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // BOTÃO CADASTRAR
              _buildButton(
                context,
                titulo: "Cadastrar Produtos",
                icon: Icons.add_box,
                color: const Color.fromARGB(255, 43, 109, 114),
                pagina:
                    const CadastrarProdutos(),
              ),

              const SizedBox(height: 20),

              // BOTÃO LISTAR
              _buildButton(
                context,
                titulo: "Listar Produtos",
                icon: Icons.list_alt,
                color: const Color.fromARGB(255, 36, 68, 73),
                pagina:
                    const ListarProdutos(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required String titulo,
    required IconData icon,
    required Color color,
    required Widget pagina,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 70,

      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,

          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(16),
          ),
        ),

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => pagina,
            ),
          );
        },

        icon: Icon(
          icon,
          size: 30,
        ),

        label: Text(
          titulo,

          style: const TextStyle(
            fontSize: 20,
            fontWeight:
                FontWeight.bold,
          ),
        ),
      ),
    );
  }
}