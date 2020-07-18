import 'package:flutter/material.dart';
import 'package:flutter_project_accelerator/uilayout.dart';
import 'package:flutter_project_accelerator/components/home/maincard.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UILayout().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: MainCard(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {},
      ),
      // On Android by default its false
      centerTitle: true,
      title: Image.asset("assets/images/logo.png"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        SizedBox(
          // It means 5 because by out defaultSize = 10
          width: UILayout.defaultSize * 0.5,
        )
      ],
    );
  }
}