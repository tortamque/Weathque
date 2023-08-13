import 'package:flutter/material.dart';
import 'package:weathque/config/theme/custom_colors.dart';
import 'package:weathque/features/app/presentation/widgets/condition/condition_animation.dart';
import 'package:weathque/features/app/presentation/widgets/condition/condition_text.dart';

class Condition extends StatefulWidget {
  final String condition;

  const Condition({
    required this.condition,
    super.key
  });

  @override
  State<Condition> createState() => _ConditionState();
}

class _ConditionState extends State<Condition> {
  final Duration animationDuration = const Duration(milliseconds: 500);
  final Curve animationCurve = Curves.easeOutSine;
  bool isAnimated = false;
  
  @override
  void initState() {
    _startAnimation();
    super.initState();
  }

  void _startAnimation() async{
    await Future.delayed(const Duration(milliseconds: 600))
      .then((value) => setState(() => isAnimated = true));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Stack(
          children: [
            ConditionText(
              text: widget.condition,
              color: Colors.transparent,
            ),

            ConditionAnimation(
              isAnimated: isAnimated, 
              animationDuration: animationDuration, 
              animationCurve: animationCurve, 
              positionInitialValue: 20, 
              opacityInitialValue: 0,
              child: ConditionText(
                text: widget.condition,
                color: CustomColors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}