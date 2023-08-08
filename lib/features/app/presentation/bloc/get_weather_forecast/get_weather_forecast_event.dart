abstract class GetWeatherForecastEvent{
  const GetWeatherForecastEvent();
}

class GetWeatherForecast extends GetWeatherForecastEvent{
  final String cityName;

  const GetWeatherForecast({
    required this.cityName
  });
}