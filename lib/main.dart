import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:weather/localizations/messages.i18n.dart';
import 'package:weather/viewModel/homeViewModel.dart';
import 'package:weather/views/homeScreen.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Messages messages = Messages();

    return MaterialApp(
      title: messages.main.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(messages.main.title),
          ),
          body: Center(
            child: HomeScreen(),
          ),
        ),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale("en", ""),
        const Locale("pl", "")
      ],
    );
  }
}
