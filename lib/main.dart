import 'package:flutter/material.dart';
import 'package:flutter_project_accelerator/components/app/appheader.dart';
import 'package:flutter_project_accelerator/components/app/appdrawer.dart';

import 'package:flutter_project_accelerator/screens/homescreen.dart';
import 'package:flutter_project_accelerator/screens/continentsscreen.dart';
import 'package:flutter_project_accelerator/screens/settingsscreen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  Widget currentWidget = HomeScreen();

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/continents': (context) => ContinentsScreen(),
        '/settings': (context) => SettingsScreen()
      },
      theme: ThemeData(
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.grey.shade800),
          actionsIconTheme: IconThemeData(color: Colors.grey.shade800),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppHeader(),
        drawer: AppDrawer(),
        body: currentWidget,
      ),
    );
  }
}
