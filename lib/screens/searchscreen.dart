import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_project_accelerator/services/ioc.dart';
import 'package:flutter_project_accelerator/services/geodataservice.dart';
import 'package:flutter_project_accelerator/services/localizationservice.dart';
import 'package:flutter_project_accelerator/components/search/searchform.dart';
import 'package:flutter_project_accelerator/components/search/searchresults.dart';
import 'package:flutter_project_accelerator/components/search/searchstate.dart';

class SearchScreen extends StatelessWidget {
  var geoDataService = iocContainer<GeoDataService>();
  var localizationService = iocContainer<LocalizationService>();
  SearchState searchState = new SearchState();

  StreamController<SearchState> _searchStreamCtrl =
      StreamController<SearchState>.broadcast();

  Stream<SearchState> get onCurrentSearchChanged => _searchStreamCtrl.stream;

  void updateSearchState(SearchState searchState) =>
      _searchStreamCtrl.sink.add(searchState);

  void performSearch(String searchTerm) async {
    if (searchTerm == null || searchTerm.length < 3) {
      searchState.isLoading = false;
      searchState.hasError = false;
      searchState.searchMessage =
          localizationService.translate("searchhelptext");
    } else {
      var results = await geoDataService.searchCountries(searchTerm);
      searchState.searchMessage = "";
      searchState.isLoading = false;
      searchState.searchPerformed = true;
      searchState.countries = [];
      if (results != null && results.isNotEmpty) {
        searchState.countries = results.toList();
      }
    }
    updateSearchState(searchState);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      SearchForm(
          searchTerm: searchState.searchTerm,
          onSearchTermUpdate: performSearch),
      SearchResults(searchStateStream: onCurrentSearchChanged)
    ])));
  }
}
