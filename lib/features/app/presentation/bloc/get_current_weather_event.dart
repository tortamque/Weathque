abstract class GetCurrentWeatherEvent{
  const GetCurrentWeatherEvent();
}

class GetCurrentWeather extends GetCurrentWeatherEvent{
  final String cityName;

  const GetCurrentWeather({
    required this.cityName
  });
}