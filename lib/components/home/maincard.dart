import 'package:flutter/material.dart';
import 'package:flutter_project_accelerator/uilayout.dart';
import 'package:flutter_project_accelerator/components/shared/contentitem.dart';

class MainCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: UILayout.defaultSize * 2), //20
          ContentItem(
            icon: Icon(Icons.outlined_flag),
            title: "Continents",
            press: () {
              Navigator.pushNamed(context, '/continents');
            },
          ),
          ContentItem(
            icon: Icon(Icons.search),
            title: "Search",
            press: () {},
          ),
          ContentItem(
            icon: Icon(Icons.language),
            title: "Change Language",
            press: () {},
          ),
          ContentItem(
            icon: Icon(Icons.settings),
            title: "Settings",
            press: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
    );
  }
}
