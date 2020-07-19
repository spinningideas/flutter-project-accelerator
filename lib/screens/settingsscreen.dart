import 'package:flutter/material.dart';
import 'package:flutter_project_accelerator/theme.dart';
import 'package:flutter_project_accelerator/uilayout.dart';
import 'package:flutter_project_accelerator/components/settings/maincard.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UILayout().init(context);
    return Scaffold(body: MainCard());
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      leading: SizedBox(),
      // On Android it's false by default
      centerTitle: true,
      title: Text("Settings"),
      actions: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text(
            "Edit",
            style: TextStyle(
              color: Colors.white,
              fontSize: UILayout.defaultSize * 1.6, //16
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
