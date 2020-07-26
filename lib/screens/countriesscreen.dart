import 'package:flutter/material.dart';
import 'package:flutter_project_accelerator/services/ioc.dart';
import 'package:flutter_project_accelerator/services/geodataservice.dart';
import 'package:flutter_project_accelerator/models/country.dart';
import 'package:flutter_project_accelerator/components/countries/countrieslist.dart';

class CountriesScreen extends StatelessWidget {
  String continentCode;

  var geoDataService = iocContainer<GeoDataService>();

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    if (arguments != null) {
      continentCode = arguments['continentCode'];
    }

    return new Scaffold(
        body: new Container(
      child: new Center(
        // Use future builder and DefaultAssetBundle to load the local JSON file
        child: new FutureBuilder(
            future: geoDataService.getCountriesForContinentCode(continentCode),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Country> countries = snapshot.data;
                return new CountriesList(
                    continentCode: continentCode, countries: countries);
              } else if (snapshot.hasError) {
                return new Text('Error Occured');
              } else {
                return new Center(child: new CircularProgressIndicator());
              }
            }),
      ),
    ));
  }
}
