import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:weathque/features/app/data/data_sources/remote/api_service.dart';
import 'package:weathque/features/app/data/repository/weather_repository_implementation.dart';
import 'package:weathque/features/app/domain/entities/current_city_entity.dart';
import 'package:weathque/features/app/domain/entities/summary_builder.dart';
import 'package:weathque/features/app/domain/repository/weather_repository.dart';
import 'package:weathque/features/app/domain/usecases/get_current_weather.dart';
import 'package:weathque/features/app/domain/usecases/get_weather_forecast.dart';
import 'package:weathque/features/app/presentation/bloc/get_current_weather/get_current_weather_bloc.dart';
import 'package:weathque/features/app/presentation/bloc/get_weather_forecast/get_weather_forecast_bloc.dart';

GetIt locator = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  locator.registerSingleton<Dio>(Dio());

  // API Service
  locator.registerSingleton<CurrentWeatherApiService>(
    CurrentWeatherApiService(locator())
  );
  locator.registerSingleton<ForecastWeatherApiService>(
    ForecastWeatherApiService(locator())
  );

  // Repo
  locator.registerSingleton<WeatherRepository>(
    WeatherRepositoryImplementation(locator())
  );
  locator.registerSingleton<ForecastWeatherRepository>(
    ForecastWeatherRepositoryImplementation(locator())
  );

  // Use cases
  locator.registerSingleton<GetCurrentWeatherUseCase>(
    GetCurrentWeatherUseCase(locator())
  );
  locator.registerSingleton<GetWeatherForecastUseCase>(
    GetWeatherForecastUseCase(locator())
  );

  // Blocs
  locator.registerFactory<GetCurrentWeatherBloc>(
    () => GetCurrentWeatherBloc(locator())
  );
  locator.registerFactory<GetWeatherForecastBloc>(
    () => GetWeatherForecastBloc(locator())
  );

  //Entities
  locator.registerSingleton(CurrentCity());
  locator.registerSingleton(SummaryBuilder());
}