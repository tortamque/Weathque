import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathque/config/theme/app_themes.dart';
import 'package:weathque/core/dependency_injection.dart';
import 'package:weathque/features/app/presentation/bloc/get_current_weather/get_current_weather_bloc.dart';
import 'package:weathque/features/app/presentation/bloc/get_current_weather/get_current_weather_event.dart';
import 'package:weathque/features/app/presentation/bloc/get_current_weather/get_current_weather_state.dart';
import 'package:weathque/features/app/presentation/bloc/get_weather_forecast/get_weather_forecast_bloc.dart';
import 'package:weathque/features/app/presentation/bloc/get_weather_forecast/get_weather_forecast_event.dart';
import 'package:weathque/features/app/presentation/bloc/get_weather_forecast/get_weather_forecast_state.dart';
import 'package:weathque/features/app/presentation/pages/loading_page.dart';
import 'package:weathque/features/app/presentation/pages/weather_page.dart';
void main() {
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetCurrentWeatherBloc>(
          create: (context) => locator()..add(const GetCurrentWeather(cityName: "Paris"))
        ),
        BlocProvider<GetWeatherForecastBloc>(
          create: (context) => locator()..add(const GetWeatherForecast(cityName: "Paris")),
        )
      ], 
      child: MaterialApp(
          theme: theme(),
          home: BlocBuilder<GetCurrentWeatherBloc, GetCurrentWeatherState>(
            builder: (_, currentWeatherState) {
              if(currentWeatherState is GetCurrentWeatherLoading){
                return const LoadingPage();
              }
              if(currentWeatherState is GetCurrentWeatherDone){
                return BlocBuilder<GetWeatherForecastBloc, GetWeatherForecastState>(
                  builder: (_, forecastWeatherState) {
                    if(forecastWeatherState is GetWeatherForecastLoading){
                      return const LoadingPage();
                    }
                    if(forecastWeatherState is GetWeatherForecastDone){
                      return WeatherPage(
                        weatherEntity: currentWeatherState.weatherEntity,
                      );
                    }
                    return const SizedBox();
                  },
                );
              }
              return const SizedBox();
            },
          ),
      )
    );
  }
}
