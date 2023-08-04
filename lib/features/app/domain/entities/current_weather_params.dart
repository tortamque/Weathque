import 'package:weathque/features/app/domain/entities/parameters.dart';

class CurrentWeatherParams extends Parameters{
  final String latitude;
  final String longitude;

  CurrentWeatherParams({
    required this.latitude, 
    required this.longitude
  });
}