import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_accelerator/models/continent.dart';

class ContinentsList extends StatelessWidget {
  final List<Continent> continents;
  ContinentsList({Key key, this.continents}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: continents == null ? 0 : continents.length,
        itemBuilder: (BuildContext context, int index) {
          return
                new Card(
                  child: new Container(
                    child: new Center(
                        child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Text(
                          continents[index].continentName,
                           style: new TextStyle(
                              fontSize: 20.0, color: Colors.blue[700]),
                        )
                      ],
                    )),
                    padding: const EdgeInsets.all(15.0),
                  ),
             );
        });
    }
}