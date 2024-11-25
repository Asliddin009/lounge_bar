import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InteractiveViewer(
        minScale: 1, // Минимальный масштаб
        maxScale: 5, // Максимальный масштаб
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/menu.jpg'), // Укажите путь к вашему изображению
              fit: BoxFit.fill, // Делает изображение на весь экран
            ),
          ),
        ),
      ),
    );
  }
}
