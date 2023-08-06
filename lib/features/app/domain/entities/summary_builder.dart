import 'package:weathque/features/app/domain/entities/weather_entity.dart';

class SummaryBuilder{
  String call(WeatherEntity weatherEntity){
    String result = """Now it feels like +${weatherEntity.information.feelsLike!.round()}°, actually +${weatherEntity.information.temp!.round()}°.
It feels that way because of the ${weatherEntity.weather[0].description}. 
Today, the temperature is felt in the range from +${weatherEntity.information.tempMin!.round()}° to ${weatherEntity.information.tempMax!.round()}°.""";

    return result;
  }
}