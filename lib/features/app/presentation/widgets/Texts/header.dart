import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String text;

  const Header({
    required this.text,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 18
      ),
    );
  }
}