import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather/viewModel/homeViewModel.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = Provider.of<HomeViewModel>(context);
    viewModel.loadWeatherForDefaultLocation();

    return Scaffold(
      appBar: AppBar(title: Text(viewModel.displayName)),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(viewModel.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: viewModel.forecast == null
                ? Text("Loading...")
                : Text(
                    "Forecast: ${viewModel.forecast.currentWeather.description}")),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.blueGrey,
    );
  }
}
