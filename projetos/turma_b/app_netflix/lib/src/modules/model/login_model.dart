//Classe Login
class LoginModal{
  final String email;
  final String password;
  final bool rememberMe;

  //toda classe tem construtor
  const LoginModal({
    required this.email,
    required this.password,
    required this.rememberMe
  });

  bool get isValid{
    return email.trim().isEmpty && password.trim().length >= 8;
  }
  //Classe preparada para um banco de dados
  //Objeto Dart
  //Converter o Objeto Dart para um Documento JSON

  Map<String, dynamic> toMap(){
    return{
      'email': email,
      'password': password,
      'rememberMe': rememberMe

    };

  }
  factory LoginModal.fromMap(Map<String, dynamic> map){
    return LoginModal(
      email: map['email'] ?? '', 
      password: map['password'] ?? '', 
      rememberMe: map['rememberMe'] ?? false, 
      );
  }
}