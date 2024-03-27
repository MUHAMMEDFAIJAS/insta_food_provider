import 'package:firstproject/view/cart_screen.dart';
import 'package:firstproject/view/home_screen.dart';
import 'package:firstproject/view/settings_screen.dart';
import 'package:flutter/material.dart';

class Bottombar extends ChangeNotifier {
  int currentindex = 0;

  List screens = [const HomeScreen(), const AddCart(), const MySettings()];

  bootomfun(newindex) {
    currentindex = newindex;
    notifyListeners();
  }
}
