import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:weathque/features/app/data/data_sources/remote/api_service.dart';
import 'package:weathque/features/app/data/repository/weather_repository_implementation.dart';
import 'package:weathque/features/app/domain/repository/weather_repository.dart';
import 'package:weathque/features/app/domain/usecases/get_current_weather.dart';

GetIt locator = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  locator.registerSingleton<Dio>(Dio());

  // API Service
  locator.registerSingleton<CurrentWeatherApiService>(
    CurrentWeatherApiService(locator())
  );

  // Repo
  locator.registerSingleton<WeatherRepository>(
    WeatherRepositoryImplementation(locator())
  );

  // Use cases
  locator.registerSingleton<GetCurrentWeatherUseCase>(
    GetCurrentWeatherUseCase(locator())
  );

  // Blocs
  // TODO: Create Blocs and register them here
}