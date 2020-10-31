import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/viewModel/homeViewModel.dart';
import 'package:weather/views/common/screen.dart';

class HomeScreen extends StatelessWidget implements Screen {
  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = Provider.of<HomeViewModel>(context);

    return Text(viewModel.displayName);
  }

  @override
  String get displayName => "Home Screen";
}
