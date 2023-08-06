import 'package:retrofit/retrofit.dart';
import 'package:weathque/core/constants.dart';
import 'package:dio/dio.dart';
import 'package:weathque/features/app/data/models/weather_model.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: currentWeatherUrl)
abstract class CurrentWeatherApiService{
  factory CurrentWeatherApiService(Dio dio) = _CurrentWeatherApiService;

  @GET("")
  Future<HttpResponse<WeatherModel>> getCurrentWeather({
    @Query("q") required String cityName,
    @Query("appid") required String apiKey,
    @Query("units") String units = "metric"
  });
}