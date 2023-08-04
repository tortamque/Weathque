abstract class GetCurrentWeatherEvent{
  const GetCurrentWeatherEvent();
}

abstract class GetCurrentWeather extends GetCurrentWeatherEvent{
  final String cityName;

  const GetCurrentWeather({
    required this.cityName
  });
}