import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/localizations/mainLocalizations.dart';
import 'package:weather/viewModel/homeViewModel.dart';
import 'package:weather/weather/forecast.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = Provider.of<HomeViewModel>(context);

    Forecast forecast = viewModel.forecast;
    if (forecast == null) {
      viewModel.loadWeatherForDefaultLocation();
    }

    return Scaffold(
      appBar: AppBar(
          title: Text(forecast != null
              ? forecast.cityName
              : MainLocalizations.messages(context).main.title)),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(viewModel.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: forecast == null
                ? Text("Loading...")
                : Text(
                    "Forecast: ${forecast.currentWeather.description}")),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.blueGrey,
    );
  }
}
