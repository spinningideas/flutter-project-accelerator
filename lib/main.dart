import 'dart:developer'; // for logging
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_project_accelerator/theme.dart';

import 'package:flutter_project_accelerator/services/ioc.dart';
import 'package:flutter_project_accelerator/services/navigationservice.dart';
import 'package:flutter_project_accelerator/services/localizationservice.dart';
import 'package:flutter_project_accelerator/services/storageservice.dart';

import 'package:flutter_project_accelerator/screens/homescreen.dart';
import 'package:flutter_project_accelerator/screens/continentsscreen.dart';
import 'package:flutter_project_accelerator/screens/countriesscreen.dart';
import 'package:flutter_project_accelerator/screens/countryscreen.dart';
import 'package:flutter_project_accelerator/screens/searchscreen.dart';
import 'package:flutter_project_accelerator/screens/settingsscreen.dart';

import 'package:flutter_project_accelerator/components/app/appheader.dart';
import 'package:flutter_project_accelerator/components/app/appdrawer.dart';
import 'package:flutter_project_accelerator/models/applicationstate.dart';

final localeStorageKey = 'locale_code';

void main() {
  setupIocContainer();
  runApp(App());
}

class AppState extends State<App> {
  Locale locale;
  ApplicationState state;
  NavigationService navigationService;
  LocalizationService localizationService;
  StorageService storageService;

  AppState() {
    this.storageService = iocContainer<StorageService>();
    this.navigationService = iocContainer<NavigationService>();
    this.localizationService = iocContainer<LocalizationService>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    _initAppLocalization();
    super.initState();
  }

  @override
  void reassemble() {
    super.reassemble();
  }

  Future<Locale> getUserLocale() async {
    var userLocaleCode = await this.storageService.getString(localeStorageKey);
    var userLocale = localizationService.getUserLocale(userLocaleCode);
    return userLocale;
  }

  Future<Locale> _initAppLocalization() async {
    var localeCode = await this.storageService.getString(localeStorageKey);
    locale = localizationService.getUserLocale(localeCode);
    if (localeCode == null) {
      localeCode = locale.languageCode; // set the default
    }
    localizationService.setLocale(localeCode);
    await localizationService.loadLocalizedData(localeCode);
    return locale;
  }

  void _reloadAppLocalization(Locale locale) async {
    localizationService.setLocale(locale.languageCode);
    localizationService.loadLocalizedData(locale.languageCode);
  }

  void setLocale(Locale locale) {
    _reloadAppLocalization(locale);
    setState(() {
      locale = locale;
    });
  }

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Locale>(
        future: _initAppLocalization(),
        builder: (context, AsyncSnapshot<Locale> snapshot) {
          if (snapshot.hasData) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                routes: <String, WidgetBuilder>{
                  '/': (context) => HomeScreen(),
                  '/continents': (context) => ContinentsScreen(),
                  '/countries': (context) => CountriesScreen(),
                  '/country': (context) => CountryScreen(),
                  '/search': (context) => SearchScreen(),
                  '/settings': (context) => SettingsScreen()
                },
                theme: appThemeData,
                navigatorKey: iocContainer<NavigationService>().navigatorKey,
                supportedLocales: localizationService.getSupportedLocales(),
                // These delegates make sure that the localization data for the proper language is loaded
                localizationsDelegates: [
                  // App level class which loads the translations from JSON files
                  // Built-in localization of basic text for Material widgets
                  GlobalMaterialLocalizations.delegate,
                  // Built-in localization for text direction LTR/RTL
                  GlobalWidgetsLocalizations.delegate,
                ],
                // Returns a locale which will be used by the app
                localeResolutionCallback: (locale, supportedLocales) {
                  return localizationService.getUserLocale(locale.languageCode);
                },
                builder: (context, child) {
                  return Scaffold(
                      appBar: AppHeader(), drawer: AppDrawer(), body: child);
                });
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}

class App extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    AppState state = context.findAncestorStateOfType<AppState>();
    state.setLocale(newLocale);
  }

  @override
  AppState createState() => AppState();
}
