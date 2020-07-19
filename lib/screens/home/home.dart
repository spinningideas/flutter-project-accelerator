import 'package:flutter/material.dart';
import 'package:flutter_project_accelerator/uilayout.dart';
import 'package:flutter_project_accelerator/components/home/maincard.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UILayout().init(context);
    return Scaffold(
      appBar: buildAppBar(context),
      body: MainCard(),
      drawer: buildAppDrawer(context),
    );
  }

  Drawer buildAppDrawer(BuildContext context) {
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
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Search'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (context) => IconButton(
          icon: new Icon(Icons.menu, color: Colors.grey.shade800),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      // On Android by default its false
      title: Text("FPA - Flutter Project Accelerator",
          style: TextStyle(color: Colors.grey.shade700)),
      iconTheme: IconThemeData(color: Colors.grey.shade800),
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.search,
                color: Colors.grey.shade700,
                size: 26.0,
              ),
            )),
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.more_vert, color: Colors.grey.shade700),
            )),
      ],
    );
  }
}
