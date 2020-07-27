import 'package:flutter/material.dart';
import 'package:flutter_project_accelerator/theme.dart';
import 'package:flutter_project_accelerator/services/ioc.dart';
import 'package:flutter_project_accelerator/services/navigationservice.dart';
import 'package:flutter_project_accelerator/components/app/appheader.dart';
import 'package:flutter_project_accelerator/components/app/appdrawer.dart';
import 'package:flutter_project_accelerator/screens/homescreen.dart';
import 'package:flutter_project_accelerator/screens/continentsscreen.dart';
import 'package:flutter_project_accelerator/screens/countriesscreen.dart';
import 'package:flutter_project_accelerator/screens/countryscreen.dart';
import 'package:flutter_project_accelerator/screens/searchscreen.dart';
import 'package:flutter_project_accelerator/screens/settingsscreen.dart';

void main() {
  setupIocContainer();
  runApp(App());
}

class App extends StatelessWidget {
  var navigationService = iocContainer<NavigationService>();

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
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
        builder: (context, child) {
          return Scaffold(
              appBar: AppHeader(), drawer: AppDrawer(), body: child);
        });
  }
}
