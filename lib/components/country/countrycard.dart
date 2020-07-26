import 'package:flutter/material.dart';
import 'package:flutter_project_accelerator/services/ioc.dart';
import 'package:flutter_project_accelerator/services/navigationservice.dart';
import 'package:flutter_project_accelerator/models/country.dart';
import 'package:flutter_project_accelerator/uilayout.dart';
import 'package:flutter_project_accelerator/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class CountryCard extends StatelessWidget {
  var navigationService = iocContainer<NavigationService>();
  final Country country;
  CountryCard({Key key, this.country}) : super(key: key);

  launchMapURL(String countryName) async {
    var countryEncoded = Uri.encodeFull(countryName);
    var url = 'https://www.google.com/maps/@?api=1&map_action=map&query=' +
        countryEncoded;
    if (await canLaunch(url)) {
      await launchMapURL(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    double defaultSize = UILayout.defaultSize;
    return Align(
      alignment: Alignment.topCenter,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text('Back'),
              onTap: () {
                navigationService.navigateToPreviousScreen(context);
              },
            ),
            ListTile(
                title: Text(
              country.countryName,
              style: TextStyle(
                fontSize: defaultSize * 1.6, //16
                color: kTextLightColor,
              ),
            )),
            ListTile(
              title: Text('Capital'),
              subtitle: Text(country.capital),
            ),
            ListTile(
              title: Text('Population'),
              subtitle: Text(country.population),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('SEE MAP'),
                  onPressed: () async {
                    launchMapURL(country.countryName);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
