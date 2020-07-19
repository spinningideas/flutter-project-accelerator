import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_project_accelerator/models/NavItem.dart';
import 'package:flutter_project_accelerator/screens/home/home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavItems(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FPA - Flutter Project Accelerator',
        theme: ThemeData(
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(color: Colors.white, elevation: 1),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
