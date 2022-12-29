import 'package:flutter/material.dart';

import '../data/repository/apps_repository.dart';
import '../models/register_model.dart';

class RegisterViewModel extends ChangeNotifier {
  final AppsRepository appsRepository = AppsRepository();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _obscureText = true;
  bool _obscureText2 = true;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get usernameController => _usernameController;
  TextEditingController get phoneController => _phoneController;

  bool get obscureText => _obscureText;
  bool get obscureText2 => _obscureText2;

  Future<void> postRegister() async {
    await appsRepository.postRegister(
      RegisterModel(
          name: _usernameController.text,
          email: _emailController.text,
          handphone: _phoneController.text,
          password: _passwordController.text,
          passwordConfirmation: _passwordController.text),
    );

    _emailController.clear();
    _passwordController.clear();
    _usernameController.clear();
    _phoneController.clear();
    _passwordController.clear();
    _obscureText = true;
    notifyListeners();
  }

  void changeVisibleText(bool obscureText) {
    _obscureText = obscureText;
    notifyListeners();
  }

  void changeVisibleText2(bool obscureText) {
    _obscureText2 = obscureText;
    notifyListeners();
  }
}
