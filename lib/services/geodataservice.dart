import 'dart:convert';
import 'package:flutter_project_accelerator/models/continent.dart';
import 'package:flutter_project_accelerator/models/country.dart';

class GeoDataService {

  List<Country> parseCountryJson(String response) {
    if(response==null){
      return [];
    }
    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Country>((json) => new Country.fromJson(json)).toList();
  }

  List<Continent> parseContinentJson(String response) {
    if(response==null){
      return [];
    }
    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Continent>((json) => new Continent.fromJson(json)).toList();
  }

}
