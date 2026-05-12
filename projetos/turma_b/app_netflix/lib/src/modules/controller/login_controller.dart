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

  
}