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
  String description;

  WeatherSymbol symbol;

  double temperature;

  Weather(this.description, this.symbol, this.temperature);
}