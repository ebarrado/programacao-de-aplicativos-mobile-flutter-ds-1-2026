//classe controller
import 'package:app_spotify/src/auth/model/login_model.dart';
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier{

  bool rememberMe = false;
  bool isLoading = false;
  String? error;

  void  ativarDesativarRememberMe(bool valor){
    rememberMe = valor;
    notifyListeners();
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async{
    isLoading = true;
    error = null;
    notifyListeners();

    final model = LoginModel(
      email: email, 
      password: password, 
      rememberMe: rememberMe
      );

      await Future.delayed(const Duration(seconds: 1));

      if(!model.isValid){
        error = 'Informe email e senha com no mínimo 8 caracteres';
        isLoading = false;
        notifyListeners();
        return false;
      }
      isLoading = false;
      notifyListeners();
      return true;


  }
}