import 'package:flutter/material.dart';

class AppDrawer extends Drawer {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 50.0,
            child: DrawerHeader(
                child: Text('', style: TextStyle(color: Colors.grey.shade800)),
                decoration: BoxDecoration(color: Colors.white),
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.all(0.0)),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            title: Text('Continents'),
            onTap: () {
              Navigator.pushNamed(context, '/continents');
            },
          ),
          ListTile(
            title: Text('Search'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
