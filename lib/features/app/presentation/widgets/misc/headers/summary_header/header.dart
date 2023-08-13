import 'package:flutter/material.dart';
import 'package:weathque/config/theme/custom_colors.dart';
import 'package:weathque/features/app/presentation/widgets/misc/headers/summary_header/header_animation.dart';
import 'package:weathque/features/app/presentation/widgets/misc/headers/summary_header/header_text.dart';

class Header extends StatefulWidget {
  final String text;

  const Header({
    required this.text,
    super.key
  });

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final Duration animationDuration = const Duration(milliseconds: 500);
  final Curve animationCurve = Curves.easeOutSine;
  bool isAnimated = false;
  
  @override
  void initState() {
    _startAnimation();
    super.initState();
  }

  void _startAnimation() async{
    await Future.delayed(const Duration(milliseconds: 1200))
      .then((value) => setState(() => isAnimated = true));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HeaderText(
          text: widget.text, 
          color: Colors.transparent
        ),

        HeaderAnimation(
          curve: animationCurve, 
          duration: animationDuration, 
          animationField: isAnimated, 
          positionInitialValue: 20, 
          opacityInitialValue: 0,
          child: HeaderText(
            text: widget.text, 
            color: CustomColors.black
          ),
        )
      ],
    );
  }
}