import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:loung_bar/ui/home_page.dart';
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
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(path: '/qr_code', builder: (context, state) => const QrCodeScreen())
  ],
);
