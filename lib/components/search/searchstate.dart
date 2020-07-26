import 'package:flutter_project_accelerator/models/country.dart';

class SearchState {
  bool searchPerformed = false;
  bool isLoading = false;
  List<Country> countries = [];
  bool hasError = false;
  String searchTerm = '';
  String searchMessage = '';

  @override
  String toString() =>
      'SearchState {countries: ${countries.toString()}, searchPerformed: $searchPerformed, isLoading: $isLoading, hasError: $hasError }';
}
