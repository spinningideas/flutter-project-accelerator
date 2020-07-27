import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class LocalizationService {
  static Map<String, String> _supportedLocales = {
    'enUS': 'English',
    'esES': 'Spanish',
    'zhCN': 'Chinese'
  };

  String getDefaultLocale() {
    return 'enUS';
  }

  Map<String, String> getSupportedLocales() {
    return _supportedLocales;
  }

  Future<Map<String, String>> loadLocalizedData(String localeCode) async {
    var localeFilePath = 'assets/i18n/' + localeCode + '.json';
    var rawJson = await rootBundle.loadString(localeFilePath);
    Map<String, String> map = jsonDecode(rawJson);
    return map = map;
  }

  Future<Map<String, String>> getLocalizedData(
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
