import 'package:flutter/material.dart';
import 'package:weathque/config/theme/custom_colors.dart';
import 'package:weathque/features/app/presentation/widgets/summary_text/summary_animation.dart';
import 'package:weathque/features/app/presentation/widgets/summary_text/summary_text.dart';

// ignore: must_be_immutable
class Summary extends StatefulWidget {
  final String text;
  late String _line1;
  late String _line2;
  late String _line3;

  Summary({
    required this.text,
    super.key
  }){
    _line1 = text.split("\n")[0];
    _line2 = text.split("\n")[1];
    _line3 = text.split("\n")[2];
  }

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  final Duration animationDuration = const Duration(milliseconds: 500);
  final Curve animationCurve = Curves.easeOutSine;
  bool isAnimatedLine1 = false;
  bool isAnimatedLine2 = false;
  bool isAnimatedLine3 = false;
  
  @override
  void initState() {
    _startAnimationLine1();
    _startAnimationLine2();
    _startAnimationLine3();
    super.initState();
  }

  void _startAnimationLine1() async{
    await Future.delayed(const Duration(milliseconds: 1400))
      .then((value) => setState(() => isAnimatedLine1 = true));
  }

  void _startAnimationLine2() async{
  await Future.delayed(const Duration(milliseconds: 1600))
    .then((value) => setState(() => isAnimatedLine2 = true));
  }

  void _startAnimationLine3() async{
  await Future.delayed(const Duration(milliseconds: 1800))
    .then((value) => setState(() => isAnimatedLine3 = true));
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SummaryText(text: widget._line1, color: Colors.transparent),
              SummaryAnimation(
                curve: animationCurve, 
                duration: animationDuration, 
                animationField: isAnimatedLine1, 
                positionInitialValue: 20, 
                opacityInitialValue: 0, 
                child: SummaryText(text: widget._line1, color: CustomColors.black)
              )
            ],
          ),
          Stack(
            children: [
              SummaryText(text: widget._line2, color: Colors.transparent),
              SummaryAnimation(
                curve: animationCurve, 
                duration: animationDuration, 
                animationField: isAnimatedLine2, 
                positionInitialValue: 20, 
                opacityInitialValue: 0, 
                child: SummaryText(text: widget._line2, color: CustomColors.black)
              )
            ],
          ),
          Stack(
            children: [
              SummaryText(text: widget._line3, color: Colors.transparent),
              SummaryAnimation(
                curve: animationCurve, 
                duration: animationDuration, 
                animationField: isAnimatedLine3, 
                positionInitialValue: 20, 
                opacityInitialValue: 0, 
                child: SummaryText(text: widget._line3, color: CustomColors.black)
              )
            ],
          ),
        ],
      ),
    );
  }
}