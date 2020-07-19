import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_accelerator/models/continent.dart';
import 'package:flutter_project_accelerator/services/geodataservice.dart';
import 'package:flutter_project_accelerator/components/continents/continentslist.dart';

class ContinentsScreen extends StatelessWidget {

  var geoDataService = new GeoDataService();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
          child: new Center(
            // Use future builder and DefaultAssetBundle to load the local JSON file
            child: new FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/geodata/continents.json'),
                builder: (context, snapshot) {
                  List<Continent> continents =
                      geoDataService.parseContinentJson(snapshot.data.toString());
                  return !continents.isEmpty
                      ? new ContinentsList(continents: continents)
                      : new Center(child: new CircularProgressIndicator());
                }),
          ),
        ));
  }

}