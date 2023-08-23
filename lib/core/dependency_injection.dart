import 'package:get_it/get_it.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:weathque/features/app/data/data_sources/local/storage.dart';
import 'package:weathque/features/app/data/data_sources/remote/api_service.dart';
import 'package:weathque/features/app/data/repository/storage_repository_implementation.dart';
import 'package:weathque/features/app/data/repository/weather_repository_implementation.dart';
import 'package:weathque/features/app/domain/entities/summary_builder.dart';
import 'package:weathque/features/app/domain/repository/weather_repository.dart';
import 'package:weathque/features/app/domain/usecases/delete_city.dart';
import 'package:weathque/features/app/domain/usecases/get_cities.dart';
import 'package:weathque/features/app/domain/usecases/get_current_weather.dart';
import 'package:weathque/features/app/domain/usecases/get_weather_forecast.dart';
import 'package:weathque/features/app/domain/usecases/save_city.dart';
import 'package:weathque/features/app/presentation/bloc/add_city/cities_changed_cubit.dart';
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

  // Storage
  locator.registerSingleton<StorageImplementation>(StorageImplementation());

  // Repo
  locator.registerSingleton<WeatherRepository>(
    WeatherRepositoryImplementation(locator())
  );
  locator.registerSingleton<ForecastWeatherRepository>(
    ForecastWeatherRepositoryImplementation(locator())
  );
  locator.registerSingleton<StorageRepositoryImplementation>(
    StorageRepositoryImplementation(locator<StorageImplementation>())
  );

  // Use cases
  locator.registerSingleton<GetCurrentWeatherUseCase>(
    GetCurrentWeatherUseCase(locator())
  );
  locator.registerSingleton<GetWeatherForecastUseCase>(
    GetWeatherForecastUseCase(locator())
  );
  locator.registerSingleton<SaveCityUseCaseImplementation>(
    SaveCityUseCaseImplementation(locator<StorageRepositoryImplementation>())
  );
  locator.registerSingleton<GetCitiesUseCaseImplementation>(
    GetCitiesUseCaseImplementation(locator<StorageRepositoryImplementation>())
  );
  locator.registerSingleton<DeleteCityUseCaseImplementation>(
    DeleteCityUseCaseImplementation(locator<StorageRepositoryImplementation>())
  );


  // Blocs
  locator.registerFactory<GetCurrentWeatherBloc>(
    () => GetCurrentWeatherBloc(locator())
  );
  locator.registerFactory<GetWeatherForecastBloc>(
    () => GetWeatherForecastBloc(locator())
  );

  // Cubit
  locator.registerFactory<CitiesChangedCubit>(
    () => CitiesChangedCubit()
  );

  // Entities
  locator.registerSingleton(SummaryBuilder());
}