import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_accelerator/services/ioc.dart';
import 'package:flutter_project_accelerator/services/navigationservice.dart';
import 'package:flutter_project_accelerator/models/continent.dart';
import 'package:flutter_project_accelerator/components/shared/listitem.dart';

class ContinentsList extends StatelessWidget {
  var navigationService = iocContainer<NavigationService>();
  final List<Continent> continents;
  ContinentsList({Key key, this.continents}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: continents == null ? 0 : continents.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: new Container(
                child: new Center(
                    child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new ListItem(
                  title: continents[index].continentName,
                  onTap: () {
                    navigationService.navigateToWithArguments('/countries',
                        arguments: <String, String>{
                          'continentCode': continents[index].continentCode
                        });
                  },
                )
              ],
            ))),
          );
        });
  }
}
