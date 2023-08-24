import 'package:flutter/material.dart';
import 'package:weathque/features/app/presentation/widgets/misc/bottom_sheet/bottom_sheet.dart';

class SettingsButton extends StatefulWidget {
  final Color bottomSheetColor;

  const SettingsButton({super.key, required this.bottomSheetColor});

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

          showCustomBottomSheet(context, widget.bottomSheetColor);
        },
      ),
    );
  }

  
}