import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weathque/config/theme/app_themes.dart';
import 'package:weathque/config/theme/custom_colors.dart';
import 'package:weathque/core/dependency_injection.dart';
import 'package:weathque/features/app/presentation/bloc/get_current_weather/get_current_weather_bloc.dart';
import 'package:weathque/features/app/presentation/bloc/get_current_weather/get_current_weather_event.dart';
import 'package:weathque/features/app/presentation/bloc/get_current_weather/get_current_weather_state.dart';
import 'package:weathque/features/app/presentation/bloc/get_weather_forecast/get_weather_forecast_bloc.dart';
import 'package:weathque/features/app/presentation/bloc/get_weather_forecast/get_weather_forecast_event.dart';
import 'package:weathque/features/app/presentation/bloc/get_weather_forecast/get_weather_forecast_state.dart';
import 'package:weathque/features/app/presentation/pages/loading_page.dart';
import 'package:weathque/features/app/presentation/pages/weather_page.dart';

import 'features/app/domain/entities/cities_enum.dart';
void main() {
  initializeDependencies();
  runApp(const WeathqueApp());
}

class WeathqueApp extends StatelessWidget {
  const WeathqueApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetCurrentWeatherBloc>(
          create: (context) => locator()..add(const GetCurrentWeather())
        ),
        BlocProvider<GetWeatherForecastBloc>(
          create: (context) => locator()..add(const GetWeatherForecast()),
        )
      ], 
      child: MaterialApp(
        builder: FToastBuilder(),
        theme: theme(),
        // GetCurrentWeatherBloc
        home: BlocBuilder<GetCurrentWeatherBloc, GetCurrentWeatherState>(
          builder: (_, currentWeatherState) {
            if(currentWeatherState is GetCurrentWeatherLoading){
              return LoadingPage(color: CustomColors.yellow.color);
            }
            if(currentWeatherState is GetCurrentWeatherDone){
              return BlocBuilder<GetWeatherForecastBloc, GetWeatherForecastState>(
                builder: (_, forecastWeatherState) {
                  if(forecastWeatherState is GetWeatherForecastLoading){
                    return LoadingPage(color: CustomColors.yellow.color);
                  }
                  if(forecastWeatherState is GetWeatherForecastDone){
                    return CarouselSlider(
                      slideTransform: const CubeTransform(),
                      unlimitedMode: true,
                      children: [
                        for (int i = 0; i < City.values.length; i++)
                          WeatherPage(
                            weatherEntity: currentWeatherState.weatherEntity![City.values[i].string]!,
                            forecastWeatherEntity: forecastWeatherState.forecastWeatherEntity![City.values[i].string]!,
                            color: CustomColors.values[i].color,
                            city: City.values[i].string,
                          ),
                      ],
                    );
                  }
                  return const SizedBox();
                },
              );
            }
            return const SizedBox();
          }
        )
      )
    );
  }
}
