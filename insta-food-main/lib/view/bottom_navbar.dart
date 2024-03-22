import 'package:firstproject/view/cart_screen.dart';
import 'package:firstproject/view/home_screen.dart';
import 'package:firstproject/view/settings_screen.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentindex = 0;

  List screens = [const HomeScreen(), const AddCart(), const MySettings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        elevation: 0,
        currentIndex: currentindex,
        onTap: (newindex) {
          setState(() {
            currentindex = newindex;
          });
        },
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black,
        backgroundColor: const Color(0xFBc2b280),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
