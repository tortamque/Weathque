import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:weathque/core/dependency_injection.dart';
import 'package:weathque/features/app/domain/usecases/get_cities.dart';
import 'package:weathque/features/app/domain/usecases/get_colors.dart';
import 'package:weathque/features/app/presentation/bloc/get_current_weather/get_current_weather_state.dart';
import 'package:weathque/features/app/presentation/bloc/get_weather_forecast/get_weather_forecast_state.dart';
import 'package:weathque/features/app/presentation/pages/weather_page.dart';

Widget buildCarouselSlider(GetCurrentWeatherState currentWeatherState, GetWeatherForecastState forecastWeatherState){
  List<String> cities = locator<GetCitiesUseCaseImplementation>()();
  List<String> colors = locator<GetColorsUseCaseImplementation>()();
  
  return CarouselSlider(
    slideTransform: const CubeTransform(),
    unlimitedMode: true,
    children: [
      for (int i = 0; i < cities.length; i++)
        WeatherPage(
          weatherEntity: currentWeatherState.weatherEntity![cities[i]]!,
          forecastWeatherEntity: forecastWeatherState.forecastWeatherEntity![cities[i]]!,
          color: Color(int.parse(colors[i])),
          city: cities[i],
        ),
    ],
  );
}