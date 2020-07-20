import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_accelerator/models/country.dart';
import 'package:flutter_project_accelerator/services/geodataservice.dart';
import 'package:flutter_project_accelerator/components/countries/countrieslist.dart';

class CountriesScreen extends StatelessWidget {
  String continentCode;

  var geoDataService = new GeoDataService();

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
            future: DefaultAssetBundle.of(context)
                .loadString('assets/geodata/countries.json'),
            builder: (context, snapshot) {
              List<Country> countries =
                  geoDataService.getCountriesForContinentCode(
                      snapshot.data.toString(), continentCode);
              return !countries.isEmpty
                  ? new CountriesList(countries: countries)
                  : new Center(child: new CircularProgressIndicator());
            }),
      ),
    ));
  }
}
