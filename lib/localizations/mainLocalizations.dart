import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather/localizations/messages_pl.i18n.dart';

import 'messages.i18n.dart';

class MainLocalizations {
  static  _MainLocalizationsDelegate get delegate =>  _MainLocalizationsDelegate();

  static Messages messages(BuildContext context) {
    return Localizations.of<Messages>(context, Messages);
  }
}

class _MainLocalizationsDelegate extends LocalizationsDelegate<Messages> {
  const _MainLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ["en", "pl"].contains(locale.languageCode);

  @override
  Future<Messages> load(Locale locale) {
    if (locale.languageCode == "pl") {
      return SynchronousFuture<Messages>(Messages_pl());
    } else {
      return SynchronousFuture<Messages>(Messages());
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Messages> old) => false;
}
