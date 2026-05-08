import 'package:app_spotify/src/auth/controller/login_controller.dart';
import 'package:app_spotify/src/widgets/background_circulo.dart';
import 'package:app_spotify/src/widgets/background_seta.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState(){
    super.initState();
    controller.addListener(_refresh);
  }

  void _refresh(){
    if(mounted) setState(() {});
  }
  //metodo dispose
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeafaf1),
      body: Stack(
        children: [
          const Positioned(
            right: -180,
            bottom: -240,
            child: BackgroundSeta(),

            ),
            const Positioned(
              right: -180,
              bottom: -240,
              child: BackgroundCirculo(),
              ),
              Center(
                child: Container(
                  width: 30,
                  height: 620,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 46
                    ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.20),
                        blurRadius: 35,
                        offset: Offset(0, 18)
                      )
                    ]
                  ),
                ),
              ),
              Column(
                children: [
                  Text("Aproveite para Ouvir Música"),
                  
                ],
              )
        ],
      ),
      
    );
  }
}