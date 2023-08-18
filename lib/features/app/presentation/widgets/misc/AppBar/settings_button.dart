import 'package:flutter/material.dart';
import 'package:weathque/config/theme/custom_colors.dart';

class SettingsButton extends StatefulWidget {
  const SettingsButton({super.key});

  @override
  State<SettingsButton> createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutSine
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: IconButton(
        icon: Icon(
          Icons.settings,
          color: Colors.black,
        ),
        onPressed: (){
          _controller.reset();
          _controller.forward();

          showModalBottomSheet(
            context: context, 
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            ),
            backgroundColor: CustomColors.yellow.color,
            builder:(context) {
              return _buildBottomSheetMenu(context);
            },
          );
        },
      ),
    );
  }

  Widget _buildBottomSheetMenu(BuildContext context){
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height - (kBottomNavigationBarHeight + kToolbarHeight),
    );
  }
}