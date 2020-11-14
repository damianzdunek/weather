import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kiwi/kiwi.dart';
import 'package:provider/provider.dart';
import 'package:weather/localizations/mainLocalizations.dart';
import 'package:weather/network/weatherClient.dart';
import 'package:weather/viewModel/viewModelFactory.dart';
import 'package:weather/views/homeScreen.dart';
import 'package:weather/weather/weatherUseCase.dart';

void main() {
  initializeKiwiContainer();
  runApp(WeatherApp());
}

void initializeKiwiContainer() {
  final KiwiContainer kiwiContainer = KiwiContainer();
  kiwiContainer.registerInstance(WeatherClient(Dio()));
  kiwiContainer
      .registerInstance(WeatherUseCase(kiwiContainer.resolve<WeatherClient>()));
  kiwiContainer.registerSingleton(
      (container) => ViewModelFactory(container.resolve<WeatherUseCase>()));
}

class WeatherApp extends StatelessWidget {
  final KiwiContainer _kiwiContainer = KiwiContainer();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) =>
          MainLocalizations.messages(context).main.title,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          indicatorColor: Colors.white,
          appBarTheme: AppBarTheme(
            color: Colors.transparent,
            centerTitle: true,
            elevation: 0,
          ),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              ),
          iconTheme: IconThemeData(
            color: Colors.white,
          )),
      home: ChangeNotifierProvider(
        create: (context) => _kiwiContainer
            .resolve<ViewModelFactory>()
            .createHomeViewModel(context),
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
