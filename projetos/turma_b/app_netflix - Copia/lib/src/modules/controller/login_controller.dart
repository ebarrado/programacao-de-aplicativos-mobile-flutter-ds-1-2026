import 'package:app_netflix/src/modules/model/login_model.dart';
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  bool rememberMe = false;

  bool isLoading = false;

  String? errorMessage;

  void ativarDesativarRememberMe(bool value) {
    rememberMe = value;
    notifyListeners();
  }

  Future<bool> login(LoginModal login) async {
    isLoading = true;

    notifyListeners();

    await Future.delayed(
      const Duration(seconds: 2),
    );

    if (!login.isValid) {
      errorMessage =
          'Digite email válido e senha maior que 8 caracteres';

      isLoading = false;

      notifyListeners();

      return false;
    }

    isLoading = false;

    notifyListeners();

    return true;
  }
}