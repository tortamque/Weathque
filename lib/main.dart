import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathque/config/theme/app_themes.dart';
import 'package:weathque/core/dependency_injection.dart';
import 'package:weathque/features/app/presentation/bloc/get_current_weather_bloc.dart';
import 'package:weathque/features/app/presentation/bloc/get_current_weather_event.dart';
import 'package:weathque/features/app/presentation/bloc/get_current_weather_state.dart';
import 'package:weathque/features/app/presentation/pages/loading_page.dart';
import 'package:weathque/features/app/presentation/pages/paris.dart';
void main() {
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetCurrentWeatherBloc>(
      create: (context) => locator()..add(const GetCurrentWeather(cityName: "Paris")),
        child: MaterialApp(
          theme: theme(),
          home: BlocBuilder<GetCurrentWeatherBloc, GetCurrentWeatherState>(
            builder: (_, state) {
              if(state is GetCurrentWeatherLoading){
                return const LoadingPage();
              }
              if(state is GetCurrentWeatherDone){
                return ParisPage();
              }
              return const SizedBox();
            },
          ),
      )
    );
  }
}
