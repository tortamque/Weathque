import 'package:retrofit/retrofit.dart';
import 'package:weathque/core/constants.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:weathque/features/app/data/models/forecast_weather_model.dart';
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

@RestApi(baseUrl: forecastWeatherUrl)
abstract class ForecastWeatherApiService{
  factory ForecastWeatherApiService(Dio dio) = _ForecastWeatherApiService;

  @GET("")
  Future<HttpResponse<ForecastWeatherModel>> getForecast({
    @Query("q") required String cityName,
    @Query("appid") required String apiKey,
    @Query("units") String units = "metric"
  });
}