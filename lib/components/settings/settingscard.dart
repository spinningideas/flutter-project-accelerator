import 'package:flutter/material.dart';
import 'package:flutter_project_accelerator/uilayout.dart';
import 'package:flutter_project_accelerator/services/ioc.dart';
import 'package:flutter_project_accelerator/services/localizationservice.dart';
import 'package:flutter_project_accelerator/services/storageservice.dart';
import 'package:flutter_project_accelerator/components/settings/selectlanguagedialog.dart';
import 'package:flutter_project_accelerator/models/settings.dart';

class SettingsCard extends StatefulWidget {
  @override
  SettingsCardState createState() => SettingsCardState();
}

class SettingsCardState extends State<SettingsCard> {
  var storageService = iocContainer<StorageService>();
  var localizationService = iocContainer<LocalizationService>();
  final localeStorageKey = 'locale_code';

  void saveSelectedLocale(localeCode) {
    storageService.setString(localeStorageKey, localeCode);
    setState(() {}); // Force this widget to reload state
  }

  Future<Settings> loadSettingsData() async {
    var userLocale = await storageService.getString(localeStorageKey);
    if (userLocale == null) {
      userLocale = localizationService.getDefaultLocale();
    }
    return new Settings(localeCode: userLocale);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
      child: new Center(
        // Use future builder and DefaultAssetBundle to load the local JSON file
        child: new FutureBuilder<Settings>(
            future: loadSettingsData(),
            builder: (context, snapshot) {
              return new SelectLanguageDialog(
                  selectedLocaleCode: snapshot.data.localeCode,
                  onSelectLocale: saveSelectedLocale);
            }),
      ),
    ));
  }
}
