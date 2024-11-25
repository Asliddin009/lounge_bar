import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:loung_bar/ui/home_page.dart';
import 'package:loung_bar/ui/menu_screen.dart';
import 'package:loung_bar/ui/qr_code_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Lounge Bar',
      // home: const HomePage(),
    );
  }
}

// GoRouter configuration
final _router = GoRouter(
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(path: '/qr_code', builder: (context, state) => const QrCodeScreen()),
        GoRoute(path: '/menu', builder: (context, state) => const MenuScreen()),
      ],
    ),
  ],
);
