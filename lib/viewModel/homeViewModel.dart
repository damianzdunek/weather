import 'package:flutter/material.dart';
import 'package:weather/localizations/mainLocalizations.dart';
import 'package:weather/common/assets.dart';
import 'package:weather/weather/forecast.dart';
import 'package:weather/weather/weatherUseCase.dart';

class HomeViewModel extends ChangeNotifier {
  static const double _defaultLocationLat = 51.784081;

  static const double _defaultLocationLon = 19.462310;

  final BuildContext _context;

  final WeatherUseCase _weatherUseCase;

  HomeViewModel(this._context, this._weatherUseCase);

  String get displayName => MainLocalizations.messages(_context).main.title;

  Forecast _forecast;

  Forecast get forecast => _forecast;

  String _backgroundImage = Assets.clearSkyImage;

  String get backgroundImage => _backgroundImage;

  void loadWeatherForDefaultLocation() {
    _weatherUseCase
        .fetchForecast(_defaultLocationLat, _defaultLocationLon)
        .then((value) {
      _forecast = value;
      notifyListeners();
    });
  }
}
