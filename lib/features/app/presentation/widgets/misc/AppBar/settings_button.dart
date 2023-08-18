import 'package:flutter/material.dart';
import 'package:weathque/config/theme/custom_colors.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.settings,
        color: Colors.black,
      ),
      onPressed: (){
        showModalBottomSheet(
          context: context, 
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: CustomColors.yellow.color,
          builder:(context) {
            return _buildBottomSheetMenu(context);
          },
        );
      },
    );
  }

  Widget _buildBottomSheetMenu(BuildContext context){
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height - (kBottomNavigationBarHeight + kToolbarHeight),
    );
  }
}