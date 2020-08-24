import 'package:flutter/material.dart';
import 'package:flutter_project_accelerator/services/localizationservice.dart';
import 'package:flutter_project_accelerator/services/ioc.dart';

class SelectLanguageDialog extends StatefulWidget {
  SelectLanguageDialog(Key key, String localeCode, Function onSelect)
      : super(key: key) {
    if (localeCode != null) {
      selectedLocaleCode = localeCode;
    }
    onSelectLocale = onSelect;
  }

  String selectedLocaleCode;
  Function onSelectLocale;

  @override
  SelectLanguageDialogState createState() => new SelectLanguageDialogState();
}

class SelectLanguageDialogState extends State<SelectLanguageDialog> {
  var localizationService = iocContainer<LocalizationService>();
  SimpleDialogOption getOption(String text, String value) {
    Color textColor = Colors.grey[800];
    double fontSize = 18;
    if (this.widget.selectedLocaleCode != null &&
        value == this.widget.selectedLocaleCode) {
      textColor = Colors.blue[900];
      fontSize = 20;
    }

    return new SimpleDialogOption(
      child: new Text(text,
          style: new TextStyle(color: textColor, fontSize: fontSize)),
      onPressed: () {
        this.widget.onSelectLocale(value);
        Navigator.pop(context);
      },
    );
  }

  List<Widget> buildLanguageOptions() {
    var languages = localizationService.getSupportedLocaleCodes();
    var options = new List<Widget>();
    languages.forEach((key, val) => options.add(getOption(val, key)));
    return options;
  }

  Future showLanguageDialog() async {
    await showDialog(
        context: context,
        child: new SimpleDialog(
          title: new Text("Select Language"),
          children: buildLanguageOptions(),
        )).then((val) {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text(this.widget.selectedLocaleCode != null
                  ? this.widget.selectedLocaleCode
                  : ""),
              new RaisedButton(
                  child: Text("Select Language"),
                  onPressed: () => showLanguageDialog())
            ],
          ),
        ),
      ),
    );
  }
}
