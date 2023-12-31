import 'package:flutter/material.dart';
import 'package:weathque/features/app/presentation/widgets/animations/top_animation.dart';
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

        TopAnimation(
          curve: animationCurve, 
          duration: animationDuration, 
          animationField: isAnimated, 
          positionInitialValue: MediaQuery.of(context).size.height/40, 
          opacityInitialValue: 0,
          child: HeaderText(
            text: widget.text, 
            color: Colors.black
          ),
        )
      ],
    );
  }
}