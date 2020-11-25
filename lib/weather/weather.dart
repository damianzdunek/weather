enum WeatherSymbol {
  sun,
  sunCloud,
  cloud,
  brokenClouds,
  rain,
  rainSun,
  thunderstorm,
  snow,
  mist,
  moon,
  moonCloud,
  rainMoon,
  unknown
}

class Weather {
  String cityName;

  String description;

  WeatherSymbol symbol;

  double temperature;

  Weather(this.cityName, this.description, this.symbol, this.temperature);
}