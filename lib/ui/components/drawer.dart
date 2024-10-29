import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.asset('assets/images/image_logo.png'),
            ),
          ),
          ListTile(
            title: const Text('Меню'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Акции'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Контакты'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
