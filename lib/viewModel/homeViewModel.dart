import 'package:flutter/material.dart';
import 'package:weather/common/assets.dart';
import 'package:weather/weather/forecast.dart';
import 'package:weather/weather/weather.dart';
import 'package:weather/weather/weatherUseCase.dart';

class HomeViewModel extends ChangeNotifier {
  static const double _defaultLocationLat = 51.784081;

  static const double _defaultLocationLon = 19.462310;

  final BuildContext _context;

  final WeatherUseCase _weatherUseCase;

  HomeViewModel(this._context, this._weatherUseCase);

  Forecast _forecast;

  Forecast get forecast => _forecast;

  String get backgroundImage {
    if (forecast == null) {
      return Assets.clearSkyImage;
    } else {
      return _backgroundImageForCurrentWeather;
    }
  }

  String get _backgroundImageForCurrentWeather {
    switch (forecast.currentWeather.symbol) {
      case WeatherSymbol.sun:
        return Assets.clearSkyImage;
      default:
        return Assets.overcastImage;
    }
  }

  void loadWeatherForDefaultLocation() {
    _weatherUseCase
        .fetchForecast(_defaultLocationLat, _defaultLocationLon)
        .then((value) {
      _forecast = value;
      notifyListeners();
    });
  }
}
