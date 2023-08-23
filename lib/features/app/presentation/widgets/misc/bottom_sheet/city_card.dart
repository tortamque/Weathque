import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathque/core/dependency_injection.dart';
import 'package:weathque/features/app/domain/usecases/delete_city.dart';
import 'package:weathque/features/app/presentation/bloc/add_city/cities_changed_cubit.dart';
import 'package:weathque/features/app/presentation/widgets/animations/top_animation.dart';

class CityCard extends StatefulWidget {
  final String name;
  final int index;

  const CityCard({super.key, required this.name, required this.index});

  @override
  State<CityCard> createState() => _CityCardState();
}

class _CityCardState extends State<CityCard> {
  bool isAnimated = false;
  final Duration animationDuration = const Duration(milliseconds: 750);
  final Curve animationCurve = Curves.easeOutSine;
  final int animationStep = 200;

  @override
  void initState() {
    _animate();
    super.initState();
  }

  void _animate() async{
    await Future.delayed(Duration(milliseconds: (widget.index + 1) * animationStep))
      .then((value) => setState(() => isAnimated = true));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                widget.name,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.transparent
                ),
              )
            )
          ),
        ),

        TopAnimation(
          curve: animationCurve, 
          duration: animationDuration, 
          animationField: isAnimated, 
          positionInitialValue: MediaQuery.of(context).size.height/11, 
          opacityInitialValue: 1, 
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.5),
            child: Dismissible(
              key: Key(widget.name),
              onDismissed: (_) async {
                await locator<DeleteCityUseCaseImplementation>()(widget.name);
                context.read<CitiesChangedCubit>()();
              },
              child: Card(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    )
                  )
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}