import 'package:flutter/material.dart';
import 'package:weathque/features/app/presentation/widgets/animations/top_animation.dart';
import 'package:weathque/features/app/presentation/widgets/date/date_card.dart';

class Date extends StatefulWidget {
  final String date;
  final Color color;

  const Date({
    required this.date, 
    required this.color,
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

          TopAnimation(
            curve: animationCurve, 
            duration: animationDuration, 
            animationField: isContainerAnimated, 
            positionInitialValue: MediaQuery.of(context).size.height/40, 
            opacityInitialValue: 0,
            child: DateCard(
              backgroundColor: Colors.black,
              textColor: Colors.transparent,
              text: widget.date,
            ),
          ),

          TopAnimation(
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
                style: TextStyle(
                  color: widget.color,
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}