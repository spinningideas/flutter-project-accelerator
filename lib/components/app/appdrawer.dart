import 'package:flutter/material.dart';
import 'package:flutter_project_accelerator/services/navigationservice.dart';
import 'package:flutter_project_accelerator/services/localizationservice.dart';
import 'package:flutter_project_accelerator/services/ioc.dart';

class AppDrawer extends Drawer {
  var navigationService = iocContainer<NavigationService>();
  var localizationService = iocContainer<LocalizationService>();

  void closeDrawerAndNavigate(BuildContext context, String routeName) {
    Scaffold.of(context).openEndDrawer();
    navigationService.navigateTo(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: Container(
      color: Colors.white,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            color: Colors.white,
            height: 50.0,
            child: DrawerHeader(
                child: Text('', style: TextStyle(color: Colors.grey.shade800)),
                decoration: BoxDecoration(color: Colors.white),
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.all(0.0)),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(localizationService.translate('home')),
            onTap: () {
              closeDrawerAndNavigate(context, '/');
            },
          ),
          ListTile(
            leading: Icon(Icons.flag),
            title: Text(localizationService.translate('continents')),
            onTap: () {
              closeDrawerAndNavigate(context, '/continents');
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text(localizationService.translate('search')),
            onTap: () {
              closeDrawerAndNavigate(context, '/search');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(localizationService.translate('settings')),
            onTap: () {
              closeDrawerAndNavigate(context, '/settings');
            },
          ),
        ],
      ),
    ));
  }
}
