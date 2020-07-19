import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

class LocalizationService {
  LocalizationService(this.locale);

  final Locale locale;

  static LocalizationService of(BuildContext context) {
    return Localizations.of<LocalizationService>(context, LocalizationService);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Hello World',
    },
    'es': {
      'title': 'Hola Mundo',
    },
  };

  String get title {
    return _localizedValues[locale.languageCode]['title'];
  }
}
