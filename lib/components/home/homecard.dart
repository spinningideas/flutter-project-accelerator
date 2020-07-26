import 'package:flutter/material.dart';
import 'package:flutter_project_accelerator/services/ioc.dart';
import 'package:flutter_project_accelerator/services/navigationservice.dart';
import 'package:flutter_project_accelerator/uilayout.dart';
import 'package:flutter_project_accelerator/components/shared/iconlistitem.dart';

class HomeCard extends StatelessWidget {
  var navigationService = iocContainer<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: UILayout.defaultSize * 2), //20
          IconListItem(
            icon: Icon(Icons.outlined_flag),
            title: "Continents",
            onTap: () {
              navigationService.navigateTo('/continents');
            },
          ),
          IconListItem(
            icon: Icon(Icons.search),
            title: "Search",
            onTap: () {
              navigationService.navigateTo('/search');
            },
          ),
          IconListItem(
            icon: Icon(Icons.settings),
            title: "Settings",
            onTap: () {
              navigationService.navigateTo('/settings');
            },
          ),
        ],
      ),
    );
  }
}
