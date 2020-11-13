import 'package:weather/network/schema/forecastSchema.dart';
import 'package:weather/network/schema/mainSchema.dart';
import 'package:weather/network/schema/weatherSchema.dart';
import 'package:weather/network/weatherClient.dart';
import 'package:weather/weather/forecast.dart';
import 'package:weather/weather/weather.dart';

class WeatherUseCase {
  WeatherClient _weatherClient;

  WeatherUseCase(this._weatherClient);

  Future<Forecast> fetchForecast(double lat, double lon) async {
    ForecastSchema forecastSchema = await _weatherClient.getForecast(lat, lon);
    Weather currentWeather = _createWeather(
        forecastSchema.list.first.weather.first,
        forecastSchema.list.first.main);
    return Forecast(forecastSchema.city.name, currentWeather);
  }

  Weather _createWeather(
      WeatherSchema currentWeatherSchema, MainSchema mainSchema) {
    WeatherSymbol weatherSymbol =
        _convertStringToWeatherSymbol(currentWeatherSchema.icon);
    Weather currentWeather = Weather(
        currentWeatherSchema.description, weatherSymbol, mainSchema.temp);

    return currentWeather;
  }

  WeatherSymbol _convertStringToWeatherSymbol(String iconCode) {
    switch (iconCode) {
      case "01d":
        return WeatherSymbol.sun;
      case "01n":
        return WeatherSymbol.moon;
      case "02d":
        return WeatherSymbol.sunCloud;
      case "02n":
        return WeatherSymbol.moonCloud;
      case "03d":
      case "03n":
        return WeatherSymbol.cloud;
      case "04d":
      case "04n":
        return WeatherSymbol.brokenClouds;
      case "09d":
      case "09n":
        return WeatherSymbol.rain;
      case "10d":
        return WeatherSymbol.rainSun;
      case "10n":
        return WeatherSymbol.rainMoon;
      case "11d":
      case "11n":
        return WeatherSymbol.thunderstorm;
      case "13d":
      case "13n":
        return WeatherSymbol.snow;
      case "50d":
      case "50n":
        return WeatherSymbol.mist;
      default:
        return WeatherSymbol.unknown;
    }
  }
}
