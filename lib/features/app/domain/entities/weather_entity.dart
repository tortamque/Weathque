class WeatherEntity {
  final Coord coord;
  final List<WeatherData> weather;
  final String base;
  final Information information;
  final int visibility;
  final Wind wind;
  final Clouds clouds;
  final int dt;
  final SunInformation sunInformation;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  WeatherEntity({
    required this.coord,
    required this.weather,
    required this.base,
    required this.information,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sunInformation,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });
}

class Coord {
  final double lon;
  final double lat;

  Coord({required this.lon, required this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lon: json['lon'].toDouble(),
      lat: json['lat'].toDouble(),
    );
  }
}

class WeatherData {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherData({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class Information {
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? humidity;
  final int? seaLevel;
  final int? groundLevel;

  Information({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.groundLevel,
  });

  factory Information.fromJson(Map<String, dynamic> json) {
    return Information(
      temp: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      tempMin: json['temp_min'].toDouble(),
      tempMax: json['temp_max'].toDouble(),
      pressure: json['pressure'],
      humidity: json['humidity'],
      seaLevel: json['sea_level'],
      groundLevel: json['grnd_level'],
    );
  }
}

class Wind {
  final double? speed;
  final int? deg;
  final double? gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed']?.toDouble(),
      deg: json['deg'],
      gust: json['gust']?.toDouble(),
    );
  }
}

class Clouds {
  final int all;

  Clouds({required this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      all: json['all'],
    );
  }
}

class SunInformation {
  final String country;
  final int sunrise;
  final int sunset;

  SunInformation({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory SunInformation.fromJson(Map<String, dynamic> json) {
    return SunInformation(
      country: json['country'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}
