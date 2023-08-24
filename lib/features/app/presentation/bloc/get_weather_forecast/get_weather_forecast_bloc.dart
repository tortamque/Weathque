import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathque/core/dependency_injection.dart';
import 'package:weathque/features/app/domain/entities/forecast_weather_entity.dart';
import 'package:weathque/features/app/domain/usecases/get_cities.dart';
import 'package:weathque/features/app/domain/usecases/get_weather_forecast.dart';
import 'package:weathque/features/app/presentation/bloc/get_weather_forecast/get_weather_forecast_event.dart';
import 'package:weathque/features/app/presentation/bloc/get_weather_forecast/get_weather_forecast_state.dart';

class GetWeatherForecastBloc extends Bloc<GetWeatherForecastEvent, GetWeatherForecastState>{
  final GetWeatherForecastUseCase _getWeatherForecastUseCase;

  GetWeatherForecastBloc(this._getWeatherForecastUseCase): super(const GetWeatherForecastLoading()){
    on<GetWeatherForecast>(onGetWeatherForecast);
  }

  void onGetWeatherForecast(GetWeatherForecast event, Emitter<GetWeatherForecastState> emitter) async{
    List<String> cities = locator<GetCitiesUseCaseImplementation>()();
    Map<String, ForecastWeatherEntity> entities = {};
    
    for (var city in cities) {
      final dataState = await _getWeatherForecastUseCase(cityName: city);

      entities[city] = dataState;
    }
    
    // ignore: invalid_use_of_visible_for_testing_member
    emit(
      GetWeatherForecastDone(entities)
    );
  }
}