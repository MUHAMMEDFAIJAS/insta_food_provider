import 'package:firstproject/main.dart';
import 'package:firstproject/view/bottom_navbar.dart';
import 'package:firstproject/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  final String username = 'asd';
  final String password = '123';
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  Future<void> login(context) async {
    final user = userController.text;
    final pass = passwordController.text;

    if (user == username && pass == password) {
      final sharedprf = await SharedPreferences.getInstance();
      await sharedprf.setString(SAVE_KEY, 'UserLgedIn');
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const BottomNav()));
    }
  }

  void logOut(context) async {
    final sharedprf = await SharedPreferences.getInstance();
    await sharedprf.clear();

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => Login()),
    );
  }
}
