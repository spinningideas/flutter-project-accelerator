import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_accelerator/services/ioc.dart';
import 'package:flutter_project_accelerator/services/navigationservice.dart';
import 'package:flutter_project_accelerator/services/localizationservice.dart';
import 'package:flutter_project_accelerator/models/country.dart';
import 'package:flutter_project_accelerator/components/shared/listitem.dart';

class CountriesList extends StatelessWidget {
  var navigationService = iocContainer<NavigationService>();
  var localizationService = iocContainer<LocalizationService>();
  final String continentCode;
  final List<Country> countries;
  CountriesList({Key key, this.continentCode, this.countries})
      : super(key: key);

  Widget buildCountryCard(int index) {
    return new Card(
      child: new Container(
          child: new Center(
              child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new ListItem(
              title: countries[index].countryName,
              onTap: () {
                navigationService.navigateToWithArguments('/country',
                    arguments: <String, String>{
                      'countryCode': countries[index].countryCode
                    });
              })
        ],
      ))),
    );
  }

  Widget buildNavigationListItem(String text) {
    return new ListTile(
      leading: Icon(Icons.arrow_back),
      title: Text(text),
      onTap: () {
        navigationService.navigateTo('/continents');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: countries == null ? 0 : countries.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            // return the header
            return Column(
              children: <Widget>[
                buildNavigationListItem(
                    localizationService.translate('countries')),
                buildCountryCard(index),
              ],
            );
          }
          return buildCountryCard(index);
        });
  }
}
