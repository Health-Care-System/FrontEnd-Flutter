import 'package:capstone_project/models/api/login_api.dart';
import 'package:capstone_project/models/login_model.dart';
import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final services = SignInService();
  LoginModel? loginview;
  bool succesLogin = false;

  Future<void> viewLogin() async {
    try {
      loginview = await services.signInAccount(
        email: userController.text,
        password: passwordController.text,
      );
      succesLogin = true;
      userController.clear();
      passwordController.clear();
    } catch (e) {
      succesLogin = false;
    }
    notifyListeners();
  }
}
