import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_project_accelerator/models/continent.dart';
import 'package:flutter_project_accelerator/models/country.dart';

class GeoDataService {
  Future<List<Continent>> loadContinentsData() async {
    var data = await rootBundle.loadString('assets/geodata/continents.json');
    return parseContinentJson(data);
  }

  Future<List<Country>> loadCountriesData() async {
    var data = await rootBundle.loadString('assets/geodata/countries.json');
    return parseCountryJson(data);
  }

  List<Country> parseCountryJson(String jsonData) {
    if (jsonData == null) {
      return [];
    }
    final parsed =
        json.decode(jsonData.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Country>((json) => new Country.fromJson(json)).toList();
  }

  List<Continent> parseContinentJson(String jsonData) {
    if (jsonData == null) {
      return [];
    }
    final parsed =
        json.decode(jsonData.toString()).cast<Map<String, dynamic>>();
    return parsed
        .map<Continent>((json) => new Continent.fromJson(json))
        .toList();
  }

  Future<List<Country>> getCountriesForContinentCode(
      String continentCode) async {
    final data = await loadCountriesData();
    var results = data.where((c) => c.continentCode == continentCode).toList();
    results.sort((a, b) => a.countryName.compareTo(b.countryName));
    return results;
  }

  Future<Country> getCountryForCountryCode(String countryCode) async {
    final data = await loadCountriesData();
    var results = data.where((c) => c.countryCode == countryCode).toList();
    return results.any((element) => true) ? results.first : null;
  }

  Future<List<Country>> searchCountries(String searchTerm) async {
    final data = await loadCountriesData();
    var results = data
        .where((c) => c.countryName
            .toString()
            .toLowerCase()
            .contains(searchTerm.toLowerCase()))
        .toList();
        
    if (results.isNotEmpty) {
      results.sort((a, b) => a.countryName.compareTo(b.countryName));
    }

    return results;
  }
}
