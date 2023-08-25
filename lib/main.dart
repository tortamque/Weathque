import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weathque/config/theme/app_themes.dart';
import 'package:weathque/core/dependency_injection.dart';
import 'package:weathque/features/app/data/data_sources/local/storage.dart';
import 'package:weathque/features/app/presentation/bloc/add_city/cities_changed_cubit.dart';
import 'package:weathque/features/app/presentation/bloc/get_current_weather/get_current_weather_bloc.dart';
import 'package:weathque/features/app/presentation/bloc/get_current_weather/get_current_weather_event.dart';
import 'package:weathque/features/app/presentation/bloc/get_weather_forecast/get_weather_forecast_bloc.dart';
import 'package:weathque/features/app/presentation/bloc/get_weather_forecast/get_weather_forecast_event.dart';
import 'package:weathque/features/app/presentation/bloc/widgets/cities_cubit_widget.dart';
import 'package:weathque/features/app/presentation/bloc/widgets/current_weather_bloc_widget.dart';
import 'package:weathque/features/app/presentation/bloc/widgets/forecast_bloc_widget.dart';
import 'features/app/presentation/functions/build_carousel_slider.dart';

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
        home: CitiesCubitWidget(
          onSuccess: (state) {
            return CurrentWeatherForecastBloc(
              onSuccess: (currentWeatherState) {
                return ForecastBlocWidget(
                  onSuccess: (forecastWeatherState) {
                    return buildCarouselSlider(currentWeatherState, forecastWeatherState);
                  },
                );
              },
            );
          },
        )
      )
    );
  }
}