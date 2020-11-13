import 'package:flutter/material.dart';
import 'package:weather/viewModel/homeViewModel.dart';
import 'package:weather/weather/weatherUseCase.dart';

class ViewModelFactory {
  final WeatherUseCase _weatherUseCase;

  ViewModelFactory(this._weatherUseCase);

  HomeViewModel createHomeViewModel(BuildContext context) => HomeViewModel(context, _weatherUseCase);
}