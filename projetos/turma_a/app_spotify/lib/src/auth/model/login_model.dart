//Orientação Objeto
//classe - atributos - metodos
//classe modelo
class LoginModel {
  //atributos
  final String email;
  final String password;
  final bool rememberMe;

  //toda classe tem um construtor

  const LoginModel({
    required this.email,
    required this.password,
    required this.rememberMe,

  });

  bool get isValid{
    return email.trim().isEmpty && password.trim().length >= 8;
  }


}
