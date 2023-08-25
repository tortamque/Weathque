import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathque/features/app/presentation/bloc/add_city/cities_changed_cubit.dart';

class CitiesCubitWidget extends StatelessWidget {
  final Function(List<String> state) onSuccess;

  const CitiesCubitWidget({super.key, required this.onSuccess});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitiesChangedCubit, List<String>>(
      builder: (_, cubitCities) {
        return onSuccess(cubitCities);
      },
    );
  }
}