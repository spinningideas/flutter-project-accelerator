import 'package:flutter/material.dart';
import 'package:flutter_project_accelerator/main.dart';
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

  void saveSelectedLocale(String localeCode) {
    storageService.setString(localeStorageKey, localeCode);
    var locale = localizationService.getSupportedLocale(localeCode);
    App.setLocale(context, locale); // reload app
    setState(() {}); // Force this widget to reload state
  }

  Future<Settings> loadSettingsData() async {
    var settingsLocaleCode = await storageService.getString(localeStorageKey);
    if (settingsLocaleCode == null) {
      settingsLocaleCode = localizationService.getDefaultLocaleCode();
    }
    return new Settings(localeCode: settingsLocaleCode);
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
                  ObjectKey("select-lang-dialog"),
                  (snapshot.data != null && snapshot.data.localeCode != null)
                      ? snapshot.data.localeCode
                      : null,
                  saveSelectedLocale);
            }),
      ),
    ));
  }
}
