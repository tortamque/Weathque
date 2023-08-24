import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weathque/config/theme/app_themes.dart';
import 'package:weathque/config/theme/custom_colors.dart';
import 'package:weathque/core/dependency_injection.dart';
import 'package:weathque/features/app/data/data_sources/local/storage.dart';
import 'package:weathque/features/app/domain/usecases/get_colors.dart';
import 'package:weathque/features/app/presentation/bloc/add_city/cities_changed_cubit.dart';
import 'package:weathque/features/app/presentation/bloc/get_current_weather/get_current_weather_bloc.dart';
import 'package:weathque/features/app/presentation/bloc/get_current_weather/get_current_weather_event.dart';
import 'package:weathque/features/app/presentation/bloc/get_current_weather/get_current_weather_state.dart';
import 'package:weathque/features/app/presentation/bloc/get_weather_forecast/get_weather_forecast_bloc.dart';
import 'package:weathque/features/app/presentation/bloc/get_weather_forecast/get_weather_forecast_event.dart';
import 'package:weathque/features/app/presentation/bloc/get_weather_forecast/get_weather_forecast_state.dart';
import 'package:weathque/features/app/presentation/pages/loading_page.dart';
import 'package:weathque/features/app/presentation/pages/weather_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  await locator<StorageImplementation>().ensurePrefsInitialized();
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
        ),
        BlocProvider<CitiesChangedCubit>(
          create: (context) => locator(),
        )
      ], 
      child: MaterialApp(
        builder: FToastBuilder(),
        theme: theme(),
        home: BlocBuilder<CitiesChangedCubit, List<String>>(
          builder: (_, cubitCities) {
            return BlocBuilder<GetCurrentWeatherBloc, GetCurrentWeatherState>(
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
                        List<String> cities = cubitCities;
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
                      return const SizedBox();
                    },
                  );
                }
                return const SizedBox();
              }
            );
          },
        )
      )
    );
  }
}
