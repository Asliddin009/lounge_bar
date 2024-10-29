import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({super.key, required this.child, this.height = 250, this.width, this.onTap});
  final Widget child;
  final double height;
  final double? width;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(9)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(9)),
          color: Colors.pinkAccent.withOpacity(0.1),
        ),
        child: Padding(padding: const EdgeInsets.all(25), child: child),
      ),
    );
  }
}
