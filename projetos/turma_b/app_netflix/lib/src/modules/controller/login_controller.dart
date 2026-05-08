//Classe de Controle

import 'package:app_netflix/src/modules/model/login_model.dart';
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier{
  bool rememberMe = false;
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadRememberMe() async{
    await Future.delayed(const Duration(milliseconds: 200));
    rememberMe = false;
    notifyListeners();
  }

  void ativarDesativarRememberMe(bool value){
    rememberMe = value;
    notifyListeners();
  }

  Future<bool> login({
    required String email,
    required String password
  })async{
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    //tratamento exceção
    try{
      final model = LoginModal(
      email: email, 
      password: password, 
      rememberMe: rememberMe);

      if (!model.isValid){
        throw Exception('Informe email e senha com o mínimo de 8 caracteres');
      }
      await Future.delayed(const Duration(seconds: 1));
      isLoading = false;
      notifyListeners();



    }catch(e){
      isLoading = false;
      errorMessage = e.toString().replaceAll('Exception', ',');
      notifyListeners();

      return false;
    }

  }
}