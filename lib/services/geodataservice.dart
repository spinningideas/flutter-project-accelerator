import 'dart:convert';
import 'package:flutter_project_accelerator/models/continent.dart';
import 'package:flutter_project_accelerator/models/country.dart';

class GeoDataService {
  List<Country> parseCountryJson(String response) {
    if (response == null) {
      return [];
    }
    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Country>((json) => new Country.fromJson(json)).toList();
  }

  List<Continent> parseContinentJson(String response) {
    if (response == null) {
      return [];
    }
    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed
        .map<Continent>((json) => new Continent.fromJson(json))
        .toList();
  }

  List<Country> getCountriesForContinentCode(
      String response, String continentCode) {
    if (response == null) {
      return [];
    }
    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();
    var data =
        parsed.map<Country>((json) => new Country.fromJson(json)).toList();
    return data.where((c) => c.continentCode == continentCode).toList();
  }

  Country getCountryForCountryCode(String response, String countryCode) {
    if (response == null) {
      return null;
    }
    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();
    var data =
        parsed.map<Country>((json) => new Country.fromJson(json)).toList();
    var results = data.where((c) => c.countryCode == countryCode).toList();
    if (results.length > 0) {
      return results[0];
    }
    return null;
  }
}
