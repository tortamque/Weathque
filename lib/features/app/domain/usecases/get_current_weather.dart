import 'package:weathque/core/usecases/usecase.dart';
import 'package:weathque/features/app/domain/entities/weather_entity.dart';
import 'package:weathque/features/app/domain/repository/weather_repository.dart';

class GetCurrentWeatherUseCase implements UseCase<WeatherEntity, String>{
  final WeatherRepository _weatherRepository;
  GetCurrentWeatherUseCase(this._weatherRepository);
  
  @override
  Future<WeatherEntity> call({required String cityName}) {
    return _weatherRepository.getCurrentWeather(cityName);
  }
}