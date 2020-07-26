import 'package:flutter/material.dart';
import 'package:flutter_project_accelerator/uilayout.dart';
import 'package:flutter_project_accelerator/components/shared/iconlistitem.dart';

class SettingsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: UILayout.defaultSize * 2), //20
          IconListItem(
            icon: Icon(Icons.language),
            title: "Change Language",
            onTap: () {},
          )
        ],
      ),
    );
  }
}
