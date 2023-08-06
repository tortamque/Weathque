enum City {
  paris('Paris'),
  newYork('New York'),
  sydney('Sydney');

  const City(this.value);

  final String value;

  static String getValue(String value) => City.values.firstWhere(
    (city) => city.value == value
  ).value;
}