import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weathque/features/app/presentation/widgets/misc/AppBar/settings_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final Color bottomSheetColor;

  const CustomAppBar({required this.title, super.key, required this.bottomSheetColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          SettingsButton(bottomSheetColor: bottomSheetColor)
        ],
        title: Text(
          title, 
          style: const TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark, 
        ),
      );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}