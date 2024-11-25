import 'package:flutter/material.dart';

class BaseElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const BaseElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 250,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.withOpacity(0.3), // Фиолетовый цвет кнопки
          foregroundColor: Colors.white, // Белый цвет текста кнопки
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
