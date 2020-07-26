import 'package:flutter/material.dart';
import 'package:flutter_project_accelerator/services/ioc.dart';
import 'package:flutter_project_accelerator/services/navigationservice.dart';
import 'package:flutter_project_accelerator/components/search/searchstate.dart';
import 'package:flutter_project_accelerator/components/shared/listitem.dart';
import 'package:flutter_project_accelerator/models/country.dart';

class SearchResults extends StatelessWidget {
  var navigationService = iocContainer<NavigationService>();

  Stream<SearchState> searchStateStream;

  SearchResults({Key key, this.searchStateStream}) : super(key: key);

  Widget buildCountryCard(int index, List<Country> countries) {
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

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SearchState>(
      stream: searchStateStream,
      builder: (BuildContext context, AsyncSnapshot<SearchState> state) {
        if (state.data == null || state.data.searchPerformed == false) {
          return Container();
        }
        if (state.data.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.data.hasError) {
          return Container(
            child: Text('Error'),
          );
        }
        if (state.data.searchMessage.isNotEmpty) {
          return Container(
            child: Text(state.data.searchMessage),
          );
        }
        if (state.data.searchPerformed && state.data.countries.isEmpty) {
          return Container(
            child: Text("No results found"),
          );
        }

        return Flexible(
          child: new ListView.builder(
            itemBuilder: (context, index) {
              return buildCountryCard(index, state.data.countries);
            },
            itemCount: state.data.countries.length,
          ),
        );
      },
    );
  }
}
