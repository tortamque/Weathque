import 'package:flutter/material.dart';
import 'package:weathque/features/app/presentation/widgets/misc/AppBar/settings_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;

  const CustomAppBar({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          SettingsButton()
        ],
        title: Text(
          title, 
          style: const TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
      );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}