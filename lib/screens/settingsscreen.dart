import 'package:flutter/material.dart';
import 'package:flutter_project_accelerator/theme.dart';
import 'package:flutter_project_accelerator/uilayout.dart';
import 'package:flutter_project_accelerator/components/settings/settingscard.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UILayout().init(context);
    return Scaffold(body: SettingsCard());
  }
}
