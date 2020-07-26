import 'package:flutter/material.dart';
import 'package:flutter_project_accelerator/services/ioc.dart';
import 'package:flutter_project_accelerator/services/geodataservice.dart';
import 'package:flutter_project_accelerator/models/continent.dart';
import 'package:flutter_project_accelerator/components/continents/continentslist.dart';

class ContinentsScreen extends StatelessWidget {
  var geoDataService = iocContainer<GeoDataService>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Center(
          // Use future builder and DefaultAssetBundle to load the local JSON file
          child: new FutureBuilder(
            future: geoDataService.loadContinentsData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Continent> continents = snapshot.data;
                return new ContinentsList(continents: continents);
              } else if (snapshot.hasError) {
                return new Text('Error Occured');
              } else {
                return new Center(child: new CircularProgressIndicator());
              }
            }
          ),
        ),
      )
    );
  }
}
