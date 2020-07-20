import 'package:flutter/material.dart';
import 'package:flutter_project_accelerator/models/country.dart';

class CountryCard extends StatelessWidget {
  final Country country;
  CountryCard({Key key, this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.flag),
              title: Text(country.countryName),
              subtitle: Text(country.continentCode),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('SEE MAP'),
                  onPressed: () {/* ... */},
                ),
                FlatButton(
                  child: const Text('TRAVEL'),
                  onPressed: () {/* ... */},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
