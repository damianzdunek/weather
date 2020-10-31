import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/viewModel/homeViewModel.dart';
import 'package:weather/views/homeScreen.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Weather App"),
          ),
          body: Center(
            child: HomeScreen(),
          ),
        ),
      ),
    );
  }
}
