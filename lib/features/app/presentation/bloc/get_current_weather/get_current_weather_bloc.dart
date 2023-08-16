import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathque/features/app/domain/entities/cities_enum.dart';
import 'package:weathque/features/app/domain/entities/weather_entity.dart';
import 'package:weathque/features/app/domain/usecases/get_current_weather.dart';
import 'package:weathque/features/app/presentation/bloc/get_current_weather/get_current_weather_event.dart';
import 'package:weathque/features/app/presentation/bloc/get_current_weather/get_current_weather_state.dart';

class GetCurrentWeatherBloc extends Bloc<GetCurrentWeatherEvent, GetCurrentWeatherState>{
  final GetCurrentWeatherUseCase _getCurrentWeatherUseCase;

  GetCurrentWeatherBloc(this._getCurrentWeatherUseCase): super(const GetCurrentWeatherLoading()){
    on<GetCurrentWeather>(onGetCurrentWeather);
  }

  void onGetCurrentWeather(GetCurrentWeather event, Emitter<GetCurrentWeatherState> emitter) async{
    List<City> cities = City.values;
    Map<String, WeatherEntity> entities = {};
    
    for (var city in cities) {
      final dataState = await _getCurrentWeatherUseCase.call(cityName: city.string);

      entities[city.string] = dataState;
    }
    
    // ignore: invalid_use_of_visible_for_testing_member
    emit(
      GetCurrentWeatherDone(entities)
    );
  }
}