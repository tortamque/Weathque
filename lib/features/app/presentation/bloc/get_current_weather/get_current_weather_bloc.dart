import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathque/features/app/domain/usecases/get_current_weather.dart';
import 'package:weathque/features/app/presentation/bloc/get_current_weather/get_current_weather_event.dart';
import 'package:weathque/features/app/presentation/bloc/get_current_weather/get_current_weather_state.dart';

class GetCurrentWeatherBloc extends Bloc<GetCurrentWeatherEvent, GetCurrentWeatherState>{
  final GetCurrentWeatherUseCase _getCurrentWeatherUseCase;

  GetCurrentWeatherBloc(this._getCurrentWeatherUseCase): super(const GetCurrentWeatherLoading()){
    on<GetCurrentWeather>(onGetCurrentWeather);
  }

  void onGetCurrentWeather(GetCurrentWeather event, Emitter<GetCurrentWeatherState> emitter) async{
    final dataState = await _getCurrentWeatherUseCase.call(cityName: event.cityName);
    
    // ignore: invalid_use_of_visible_for_testing_member
    emit(
      GetCurrentWeatherDone(dataState)
    );
  }
}