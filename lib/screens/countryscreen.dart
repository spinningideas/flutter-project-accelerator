import 'package:flutter/material.dart';
import 'package:flutter_project_accelerator/services/ioc.dart';
import 'package:flutter_project_accelerator/services/geodataservice.dart';
import 'package:flutter_project_accelerator/models/country.dart';
import 'package:flutter_project_accelerator/components/country/countrycard.dart';

class CountryScreen extends StatelessWidget {
  String countryCode;
  var geoDataService = iocContainer<GeoDataService>();

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    if (arguments != null) {
      countryCode = arguments['countryCode'];
    }

    return new Scaffold(
      body: new Container(
        child: new Center(
          child: new FutureBuilder(
            future: geoDataService.getCountryForCountryCode(countryCode),
            builder: (context, snapshot) {
              Country country = snapshot.data;
              return country != null
                  ? new CountryCard(country: country)
                  : new Center(child: new CircularProgressIndicator());
            }
          )
        )
      )
    );
  }
}
