import 'package:flutter/material.dart';
import 'package:flutter_project_accelerator/models/country.dart';
import 'package:flutter_project_accelerator/services/geodataservice.dart';
import 'package:flutter_project_accelerator/components/country/countrycard.dart';

class CountryScreen extends StatelessWidget {
  String countryCode;
  var geoDataService = new GeoDataService();

  @override
  Widget build(BuildContext context) {

    final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    if (arguments != null) {
      countryCode = arguments['countryCode'];
    } 

    return new Scaffold(
        body: new Container(
          child: new Center(
            // Use future builder and DefaultAssetBundle to load the local JSON file
            child: new FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/geodata/countries.json'),
                builder: (context, snapshot) {
                  Country country =
                      geoDataService.getCountryForCountryCode(snapshot.data.toString(), countryCode);
                  return country !=null
                      ? new CountryCard(country: country)
                      : new Center(child: new CircularProgressIndicator());
                }),
          ),
        ));
  }

}