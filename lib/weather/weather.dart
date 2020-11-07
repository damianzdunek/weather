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

  Weather(this.description, this.symbol);
}