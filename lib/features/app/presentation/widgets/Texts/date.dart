import 'package:flutter/material.dart';
import 'package:weathque/config/theme/custom_colors.dart';
import 'package:weathque/features/app/presentation/widgets/animations/date/date_animation.dart';
import 'package:weathque/features/app/presentation/widgets/card/date_card.dart';

class Date extends StatefulWidget {
  final String date;

  const Date({
    required this.date, 
    super.key
  });

  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {
  final Duration animationDuration = const Duration(milliseconds: 500);
  final Curve animationCurve = Curves.easeOutSine;
  bool isTextAnimated = false;
  bool isContainerAnimated = false;

  @override
  void initState() {
    _startContainerAnimation();
    _startTextAnimation();
    super.initState();
  }

  void _startTextAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500))
      .then((value) => setState(() => isTextAnimated = true));
  }

  void _startContainerAnimation() async {
    await Future.delayed(const Duration(seconds: 0))
      .then((value) => setState(() => isContainerAnimated = true));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          DateCard(
            backgroundColor: Colors.transparent,
            textColor: Colors.transparent,
            text: widget.date,
          ),

          DateAnimation(
            curve: animationCurve, 
            duration: animationDuration, 
            animationField: isContainerAnimated, 
            positionInitialValue: 20, 
            opacityInitialValue: 0,
            child: DateCard(
              backgroundColor: CustomColors.black,
              textColor: Colors.transparent,
              text: widget.date,
            ),
          ),

          DateAnimation(
            curve: animationCurve, 
            duration: animationDuration, 
            animationField: isTextAnimated, 
            positionInitialValue: 20, 
            opacityInitialValue: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5 
              ),
              child: Text(
                widget.date,
                style: const TextStyle(
                  color: CustomColors.yellow,
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}