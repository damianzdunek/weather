import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/viewModel/homeViewModel.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = Provider.of<HomeViewModel>(context);
    viewModel.loadWeatherForDefaultLocation();

    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.displayName),
      ),
      body: Center(
          child: viewModel.forecast == null
              ? Text("Loading...")
              : Text(
                  "Forecast: ${viewModel.forecast.currentWeather.description}")),
    );
  }
}
