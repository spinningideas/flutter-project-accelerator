import 'package:flutter/material.dart';
import 'package:flutter_project_accelerator/uilayout.dart';
import 'package:flutter_project_accelerator/components/home/maincard.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UILayout().init(context);
    return Scaffold(body: MainCard());
  }
}
