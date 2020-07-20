import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_accelerator/models/country.dart';
import 'package:flutter_project_accelerator/components/shared/listitem.dart';

class CountriesList extends StatelessWidget {
  final List<Country> countries;
  CountriesList({Key key, this.countries}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return new ListView.builder(
        itemCount: countries == null ? 0 : countries.length,
        itemBuilder: (BuildContext context, int index) {
          return
            new Card(
              child: new Container(
                child: new Center(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new ListItem (
                        title: countries[index].countryName,
                        press: () {
                          Navigator.pushNamed(context, 
                            '/country',
                            arguments: <String, String>{
                              'countryCode': countries[index].countryCode
                            }
                          );
                        }
                      )
                    ],
                  )
                )
              ),
            );
        });
    }
}