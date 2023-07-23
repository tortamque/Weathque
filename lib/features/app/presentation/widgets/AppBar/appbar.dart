import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;

  const CustomAppBar({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            title, 
            style: const TextStyle(
              fontWeight: FontWeight.bold
            ),
          )
        ),
      );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}