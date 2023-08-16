import 'package:weathque/core/usecases/usecase.dart';
import 'package:weathque/features/app/domain/entities/forecast_weather_entity.dart';
import 'package:weathque/features/app/domain/repository/weather_repository.dart';

class GetWeatherForecastUseCase implements UseCase<ForecastWeatherEntity, String>{
  final ForecastWeatherRepository _forecastWeatherRepository;

  GetWeatherForecastUseCase(this._forecastWeatherRepository);
  
  @override
  Future<ForecastWeatherEntity> call({required String cityName}) {
    return _forecastWeatherRepository.getForecast(cityName);
  }
}