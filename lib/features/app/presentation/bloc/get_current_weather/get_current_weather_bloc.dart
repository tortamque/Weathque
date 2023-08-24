import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathque/core/dependency_injection.dart';
import 'package:weathque/features/app/domain/entities/weather_entity.dart';
import 'package:weathque/features/app/domain/usecases/get_cities.dart';
import 'package:weathque/features/app/domain/usecases/get_current_weather.dart';
import 'package:weathque/features/app/presentation/bloc/get_current_weather/get_current_weather_event.dart';
import 'package:weathque/features/app/presentation/bloc/get_current_weather/get_current_weather_state.dart';

class GetCurrentWeatherBloc extends Bloc<GetCurrentWeatherEvent, GetCurrentWeatherState>{
  final GetCurrentWeatherUseCase _getCurrentWeatherUseCase;

  GetCurrentWeatherBloc(this._getCurrentWeatherUseCase): super(const GetCurrentWeatherLoading()){
    on<GetCurrentWeather>(onGetCurrentWeather);
  }

  void onGetCurrentWeather(GetCurrentWeather event, Emitter<GetCurrentWeatherState> emitter) async{
    // ignore: invalid_use_of_visible_for_testing_member
    emit(const GetCurrentWeatherLoading());
    
    List<String> cities = locator<GetCitiesUseCaseImplementation>()();
    Map<String, WeatherEntity> entities = {};
    
    for (var city in cities) {
      final dataState = await _getCurrentWeatherUseCase.call(cityName: city);

      entities[city] = dataState;
    }
    
    // ignore: invalid_use_of_visible_for_testing_member
    emit(
      GetCurrentWeatherDone(entities)
    );
  }
}