

import 'package:firstproject/controller/login_provider.dart';
import 'package:firstproject/view/admin/admin_page.dart';
import 'package:firstproject/view/about_us.dart';
import 'package:firstproject/view/buy_now.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySettings extends StatelessWidget {
  const MySettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.orange[300],
      ),
      body: ListView(
        children: [
          const SectionHeader(title: 'About'),
          SettingsItem(
            icon: Icons.info,
            title: 'About Us',
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AboutUsPage()));
            },
          ),
          const SectionHeader(title: 'Orders'),
          SettingsItem(
            icon: Icons.shopping_cart,
            title: 'my orders',
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const BuyNowPage()));
            },
          ),
          SettingsItem(
              icon: Icons.admin_panel_settings,
              title: 'admin',
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Adminpage()));
              }),
          SettingsItem(
              icon: Icons.logout,
              title: 'log out',
              onTap: () async {
                provider.logOut(context);
              })
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      padding: const EdgeInsets.all(16),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 20,
        ),
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const SettingsItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
