import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:weather/common/appLocationPermission.dart';
import 'package:weather/common/weatherIcons.dart';
import 'package:weather/localizations/mainLocalizations.dart';
import 'package:weather/viewModel/homeViewModel.dart';
import 'package:weather/weather/forecast.dart';
import 'package:weather/weather/weather.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = Provider.of<HomeViewModel>(context);

    Weather currentWeather = viewModel.currentWeather;

    if (currentWeather == null) {
      _loadForecastOrAskForLocationPermission(viewModel, context);
    }

    return Scaffold(
      appBar: AppBar(title: Text(currentWeather != null ? currentWeather.cityName : "–")),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(viewModel.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              _buildHeader(viewModel, context),
              _buildWeatherDetailsContent(context, viewModel),
            ],
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
    );
  }

  Align _buildHeader(HomeViewModel viewModel, BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: viewModel.isWeatherForDefaultPosition
          ? Text(MainLocalizations.messages(context).main.demo_position)
          : null,
    );
  }

  void _loadForecastOrAskForLocationPermission(
      HomeViewModel viewModel, BuildContext context) {
    switch (viewModel.locationPermission) {
      case (AppLocationPermission.denied):
        _askForLocationPermission(viewModel, context);
        break;
      case (AppLocationPermission.granted):
        viewModel.loadWeatherForCurrentPosition();
        break;
      case (AppLocationPermission.deniedForever):
        viewModel.loadWeatherForDefaultPosition();
        break;
    }
  }

  void _askForLocationPermission(
      HomeViewModel viewModel, BuildContext context) {
    if (viewModel.locationPermissionRequestsCount == 0) {
      viewModel.askForLocationPermission();
    } else if (viewModel.locationPermissionRequestsCount == 1) {
      _showLocationPermissionAlertDialog(context, viewModel);
    } else {
      viewModel.loadWeatherForDefaultPosition();
    }
  }

  void _showLocationPermissionAlertDialog(
      BuildContext context, HomeViewModel viewModel) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      showDialog(
        context: context,
        builder: (context) {
          return _buildLocationPermissionAlertDialog(context, viewModel);
        },
        barrierDismissible: false,
      );
    });
  }

  AlertDialog _buildLocationPermissionAlertDialog(
      BuildContext context, HomeViewModel viewModel) {
    return AlertDialog(
      title: Text(
        MainLocalizations.messages(context).main.location_permission_needed,
        style:
            Theme.of(context).textTheme.headline6.apply(color: Colors.black54),
      ),
      content: Text(
        MainLocalizations.messages(context)
            .main
            .location_permission_needed_description,
        style:
            Theme.of(context).textTheme.subtitle1.apply(color: Colors.black45),
      ),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
            viewModel.askForLocationPermission();
          },
          child: Text(MainLocalizations.messages(context).main.ok),
        )
      ],
    );
  }

  Widget _buildWeatherDetailsContent(
      BuildContext context, HomeViewModel viewModel) {
    assert(viewModel != null);

    Weather weather = viewModel.currentWeather;

    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.up,
          children: [
            Row(
              children: [
                Icon(weather == null
                    ? Icons.cloud_off
                    : _iconForWeatherSymbol(weather.symbol)),
                SizedBox(width: 10),
                Text(
                  weather == null ? "-" : weather.description,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            Text(
              "${weather == null ? "–" : weather.temperature.round()}°",
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
    );
  }

  IconData _iconForWeatherSymbol(WeatherSymbol symbol) {
    switch (symbol) {
      case WeatherSymbol.sun:
        return WeatherIcons.sun;
      case WeatherSymbol.sunCloud:
        return WeatherIcons.cloud_sun;
      case WeatherSymbol.moon:
        return WeatherIcons.moon;
      case WeatherSymbol.moonCloud:
        return WeatherIcons.cloud_moon;
      case WeatherSymbol.rainSun:
      case WeatherSymbol.rainMoon:
        return WeatherIcons.drizzle;
      case WeatherSymbol.cloud:
        return WeatherIcons.cloud;
      case WeatherSymbol.brokenClouds:
        return WeatherIcons.clouds;
      case WeatherSymbol.rain:
        return WeatherIcons.rain;
      case WeatherSymbol.thunderstorm:
        return WeatherIcons.clouds_flash;
      case WeatherSymbol.snow:
        return WeatherIcons.snow;
      case WeatherSymbol.mist:
        return WeatherIcons.fog;
      default:
        return WeatherIcons.sun;
    }
  }
}
