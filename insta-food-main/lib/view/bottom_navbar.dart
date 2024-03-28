import 'dart:developer';

import 'package:firstproject/controller/bottom_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Bottombar>(context);
    return Scaffold(
      body: provider.screens[provider.currentindex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        elevation: 0,
        currentIndex: provider.currentindex,
        onTap: (newindex) {
          provider.bootomfun(newindex);
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
