import 'package:flutter/material.dart';
import 'package:flutter_project_accelerator/screens/home/home.dart';
import 'package:flutter_project_accelerator/screens/settings/settings.dart';

class NavItem {
  final int id;
  final IconData icon;
  final Widget destination;

  NavItem({this.id, this.icon, this.destination});

  bool destinationChecker() {
    if (destination != null) {
      return true;
    }
    return false;
  }
}

// If we made any changes here Provider package rebuid those widget those use this NavItems
class NavItems extends ChangeNotifier {
  // By default first one is selected
  int selectedIndex = 0;

  void chnageNavIndex({int index}) {
    selectedIndex = index;
    // if any changes made it notify widgets that use the value
    notifyListeners();
  }

  List<NavItem> items = [
    NavItem(
      id: 1,
      icon: IconData(58834, fontFamily: 'MaterialIcons'),
      destination: HomeScreen(),
    ),
    NavItem(
      id: 2,
      icon: IconData(59576, fontFamily: 'MaterialIcons'),
      destination: SettingsScreen(),
    ),
  ];
}