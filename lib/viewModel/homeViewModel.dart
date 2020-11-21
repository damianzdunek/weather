import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/common/appLocationPermission.dart';
import 'package:weather/common/assets.dart';
import 'package:weather/weather/forecast.dart';
import 'package:weather/weather/weather.dart';
import 'package:weather/weather/weatherUseCase.dart';

class HomeViewModel extends ChangeNotifier {
  static const double _defaultPositionLat = 51.774081;

  static const double _defaultPositionLon = 19.462310;

  final BuildContext _context;

  final WeatherUseCase _weatherUseCase;

  Forecast _forecast;

  Forecast get forecast => _forecast;

  AppLocationPermission _locationPermission = AppLocationPermission.unknown;

  AppLocationPermission get locationPermission => _locationPermission;

  int _locationPermissionRequestsCount = 0;

  int get locationPermissionRequestsCount => _locationPermissionRequestsCount;

  bool _isWeatherForDefaultPosition = false;

  bool get isWeatherForDefaultPosition => _isWeatherForDefaultPosition;

  HomeViewModel(this._context, this._weatherUseCase) {
    _checkLocationPermission();
  }

  void _checkLocationPermission() {
    Geolocator.checkPermission().then((value) {
      _setLocationPermission(value);
      notifyListeners();
    });
  }

  void _setLocationPermission(LocationPermission value) {
    switch (value) {
      case LocationPermission.denied:
        _locationPermission = AppLocationPermission.denied;
        break;
      case LocationPermission.deniedForever:
        _locationPermission = AppLocationPermission.deniedForever;
        break;
      case LocationPermission.whileInUse:
      case LocationPermission.always:
        _locationPermission = AppLocationPermission.granted;
        break;
    }
  }

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

  void loadWeatherForDefaultPosition() {
    _loadWeatherForPosition(_defaultPositionLat, _defaultPositionLon);
    _isWeatherForDefaultPosition = true;
  }

  void loadWeatherForCurrentPosition() {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then(
        (value) => _loadWeatherForPosition(value.latitude, value.longitude));
  }

  void _loadWeatherForPosition(double lat, double lon) {
    _weatherUseCase.fetchForecast(lat, lon).then((value) {
      _forecast = value;
      notifyListeners();
    });
  }

  void askForLocationPermission() {
    Geolocator.requestPermission().then((value) {
      _locationPermissionRequestsCount++;
      _setLocationPermission(value);
      notifyListeners();
    });
  }
}
