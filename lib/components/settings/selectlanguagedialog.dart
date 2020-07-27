import 'package:flutter/material.dart';

enum Languages { EN, ES, ZH }

class SelectLanguageDialog extends StatefulWidget {
  SelectLanguageDialog({Key key, this.selectedLocaleCode, this.onSelectLocale})
      : super(key: key);

  final String selectedLocaleCode;
  final Function onSelectLocale;

  @override
  SelectLanguageDialogState createState() => new SelectLanguageDialogState();
}

class SelectLanguageDialogState extends State<SelectLanguageDialog> {
  SimpleDialogOption getOption(text, value) {
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

  Future showLanguageDialog() async {
    await showDialog(
        context: context,
        child: new SimpleDialog(
          title: new Text("Select Language"),
          children: <Widget>[
            getOption("English", "enUS"),
            getOption("Spanish", "esES"),
            getOption("Chinese", "zhCN")
          ],
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
              new Text(this.widget.selectedLocaleCode),
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
