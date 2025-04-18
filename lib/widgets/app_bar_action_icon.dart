import 'package:flutter/material.dart';

class AppBarActionIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const AppBarActionIcon({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(icon: Icon(icon), onPressed: onPressed);
  }
}
