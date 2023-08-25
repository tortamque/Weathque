import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathque/core/dependency_injection.dart';
import 'package:weathque/features/app/presentation/bloc/add_city/cities_changed_cubit.dart';
import 'package:weathque/features/app/presentation/bloc/get_current_weather/get_current_weather_bloc.dart';
import 'package:weathque/features/app/presentation/bloc/get_current_weather/get_current_weather_event.dart';
import 'package:weathque/features/app/presentation/bloc/get_weather_forecast/get_weather_forecast_bloc.dart';
import 'package:weathque/features/app/presentation/bloc/get_weather_forecast/get_weather_forecast_event.dart';

class BlocsProviderBuilder extends StatelessWidget {
  final Widget child;
  final BuildContext context;
  final List<BlocProvider> providers = [
    BlocProvider<GetCurrentWeatherBloc>(
      create: (buildContext) => locator()..add(const GetCurrentWeather())
    ),
    BlocProvider<GetWeatherForecastBloc>(
      create: (buildContext) => locator()..add(const GetWeatherForecast()),
    ),
    BlocProvider<CitiesChangedCubit>(
      create: (buildContext) => locator<CitiesChangedCubit>(),
    )
  ];

  BlocsProviderBuilder({super.key, required this.child, required this.context});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: providers, child: child);
  }
}