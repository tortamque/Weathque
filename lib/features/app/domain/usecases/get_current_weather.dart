import 'package:weathque/core/usecases/usecase.dart';
import 'package:weathque/features/app/domain/entities/current_weather_params.dart';
import 'package:weathque/features/app/domain/entities/weather_entity.dart';
import 'package:weathque/features/app/domain/repository/weather_repository.dart';

class GetCurrentWeatherUseCase implements UseCase<WeatherEntity, CurrentWeatherParams>{
  final WeatherRepository _weatherRepository;
  GetCurrentWeatherUseCase(this._weatherRepository);
  
  @override
  Future<WeatherEntity> call({required CurrentWeatherParams params}) {
    return _weatherRepository.getCurrentWeather(params.latitude, params.longitude);
  }

}