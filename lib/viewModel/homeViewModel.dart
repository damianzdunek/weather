import 'package:flutter/material.dart';
import 'package:weather/localizations/mainLocalizations.dart';

class HomeViewModel extends ChangeNotifier {
  final BuildContext _context;

  HomeViewModel(this._context);

  String get displayName =>
      MainLocalizations.messages(_context).main.title;
}
