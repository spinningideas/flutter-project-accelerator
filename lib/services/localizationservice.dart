import 'dart:async';
import 'dart:convert';
import 'dart:async' show Future;
import 'dart:ui';
import 'package:flutter/services.dart' show rootBundle;

class LocalizationService {
  Locale _locale;
  Map<String, String> _localizedData;

  static Map<String, String> _supportedLocaleCodes = {
    'en': 'English',
    'es': 'Spanish',
    'zh': 'Chinese'
  };

  static List<Locale> _supportedLocales = [
    Locale('en', 'US'),
    Locale('es', 'ES'),
    Locale('zh', 'CN')
  ];

  /// Get the default code to use for the app
  String getDefaultLocaleCode() {
    return 'en';
  }

  /// Get full list of supported Locale Codes (Map of key=code, val=language name)
  Map<String, String> getSupportedLocaleCodes() {
    return _supportedLocaleCodes;
  }

  /// Whether or not given Locale is in the supported set for this app
  bool isSupported(Locale locale) {
    return _supportedLocaleCodes.containsKey(locale.languageCode);
  }

  // Get full list of supported Locales
  List<Locale> getSupportedLocales() {
    return _supportedLocales;
  }

  /// Set the service locale using given code
  Locale setLocale(String localeCode) {
    var loc = getUserLocale(localeCode);
    _locale = loc;
    return _locale;
  }

  // Get Locale for given code from supported set of Locales
  Locale getSupportedLocale(String localeCode) {
    return _supportedLocales
        .firstWhere((f) => localeCode.contains(f.languageCode));
  }

  /// Get Locale for given localeCode or if none provide return the default for app
  Locale getUserLocale(String localeCode) {
    if (localeCode == null) {
      localeCode = getDefaultLocaleCode();
    }
    var userLocale = getSupportedLocale(localeCode);
    return userLocale;
  }

  /// Load ALL localized strings available for given locale for use throughout the app
  Future<Map<String, String>> loadLocalizedData(String localeCode) async {
    var localeFilePath = 'assets/i18n/' + localeCode + '.json';
    var rawJson = await rootBundle.loadString(localeFilePath);
    Map<String, dynamic> jsonMap = jsonDecode(rawJson);
    _localizedData = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return _localizedData;
  }

  /// Gets single localized textual value for given key from available set
  String translate(String key) {
    if (_localizedData != null) {
      if (_localizedData[key] == null) {
        return "UNKNOWN";
      }
      return _localizedData[key];
    }
    return "";
  }

  /// Gets a set of localized strings from given localization keys
  Future<Map<String, String>> getTranslations(
      String localeCode, List<String> keys) async {
    Map<String, String> results = {};
    var data = await loadLocalizedData(localeCode);
    for (var k in keys) {
      if (data.containsKey(k)) {
        results[k] = data[k];
      }
    }
    return results;
  }
}
