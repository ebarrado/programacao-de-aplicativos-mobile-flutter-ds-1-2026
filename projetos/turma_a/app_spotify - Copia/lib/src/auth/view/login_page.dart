import 'package:app_spotify/spotify_screem.dart';
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

  bool obscurePassword = true;

  @override
  void initState() {
    super.initState();

    controller.addListener(_refresh);
  }

  void _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    controller.removeListener(_refresh);

    emailController.dispose();

    passwordController.dispose();

    super.dispose();
  }

  Future<void> fazerLogin() async {
    final success = await controller.login(
      email: emailController.text,
      password: passwordController.text,
    );

    if (!mounted) return;

    if (success) {
      Navigator.pushReplacement(
        context,

        MaterialPageRoute(builder: (_) => const SpotifyScreem()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,

          content: Text(controller.error ?? "Erro no login"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeafaf1),

      body: Stack(
        children: [
          // FUNDO
          const Positioned(right: -180, bottom: -240, child: BackgroundSeta()),

          const Positioned(
            right: -180,
            bottom: -240,

            child: BackgroundCirculo(),
          ),

          // CARD LOGIN
          Center(
            child: Container(
              width: 350,
              height: 620,

              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 30),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(24),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),

                    blurRadius: 30,

                    offset: const Offset(0, 15),
                  ),
                ],
              ),

              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    // LOGO
                    Container(
                      width: 100,
                      height: 100,

                      decoration: const BoxDecoration(
                        color: Color(0xff1DB954),

                        shape: BoxShape.circle,
                      ),

                      child: const Icon(
                        Icons.music_note,

                        color: Colors.white,

                        size: 55,
                      ),
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      "Spotify",

                      style: TextStyle(
                        fontSize: 34,

                        fontWeight: FontWeight.bold,

                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Aproveite para ouvir suas músicas favoritas",

                      textAlign: TextAlign.center,

                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),

                    const SizedBox(height: 40),

                    // EMAIL
                    TextField(
                      controller: emailController,

                      decoration: InputDecoration(
                        labelText: "Email",

                        prefixIcon: const Icon(Icons.email),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // SENHA
                    TextField(
                      controller: passwordController,

                      obscureText: obscurePassword,

                      decoration: InputDecoration(
                        labelText: "Senha",

                        prefixIcon: const Icon(Icons.lock),

                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },

                          icon: Icon(
                            obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // CHECKBOX
                    Row(
                      children: [
                        Checkbox(
                          value: controller.rememberMe,

                          activeColor: const Color(0xff1DB954),

                          onChanged: (value) {
                            controller.ativarDesativarRememberMe(
                              value ?? false,
                            );
                          },
                        ),

                        const Text("Lembrar-me"),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // BOTAO LOGIN
                    SizedBox(
                      width: double.infinity,

                      height: 55,

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff1DB954),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),

                        onPressed: controller.isLoading ? null : fazerLogin,

                        child: controller.isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                "Entrar",

                                style: TextStyle(
                                  color: Colors.white,

                                  fontSize: 18,

                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    TextButton(
                      onPressed: () {},

                      child: const Text(
                        "Esqueceu sua senha?",

                        style: TextStyle(
                          color: Color(0xff1DB954),

                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
