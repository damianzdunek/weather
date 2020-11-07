import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:weather/localizations/mainLocalizations.dart';
import 'package:weather/network/weatherClient.dart';
import 'package:weather/viewModel/homeViewModel.dart';
import 'package:weather/views/homeScreen.dart';
import 'package:weather/weather/weatherUseCase.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Dio dio = Dio();
    final client = WeatherClient(dio);
    final weatherUseCase = WeatherUseCase(client);

    return MaterialApp(
      onGenerateTitle: (context) =>
          MainLocalizations.messages(context).main.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (context) => HomeViewModel(context, weatherUseCase),
        child: HomeScreen(),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        MainLocalizations.delegate,
      ],
      supportedLocales: [const Locale("en", ""), const Locale("pl", "")],
    );
  }
}
