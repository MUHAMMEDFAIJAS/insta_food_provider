// ignore_for_file: use_build_context_synchronously

import 'package:firstproject/main.dart';
import 'package:firstproject/view/bottom_navbar.dart';
import 'package:firstproject/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    gotoLogin();
    checklogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/insta food.png'),
          const Text("YOUR DELICIOUS PARTNER",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Colors.amber)),
        ],
      ),
    );
  }

  void gotoLogin() async {
    await Future.delayed(const Duration(seconds: 3));

    Navigator.of(context).pushReplacement(
        (MaterialPageRoute(builder: (context) =>  Login())));
  }

  Future<void> checklogin() async {
    final sharedprf = await SharedPreferences.getInstance();
    final userlogin = sharedprf.getString(SAVE_KEY);

    if (userlogin == null || userlogin.isEmpty) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) =>  Login()));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const BottomNav()));
    }
  }
}
