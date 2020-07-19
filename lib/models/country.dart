class Country {
  final String countryId;
  final String countryName;
  final String countryCode;
  final String continentCode;
  final String capital;
  final Int32 population;

  Country({this.countryId, 
  this.countryName, 
  this.countryCode, 
  this.continentCode, 
  this.capital, 
  this.population});

  factory Country.fromJson(Map<String, dynamic> json) {
    return new Country(
      countryId: json['countryId'] as String,
      countryName: json['countryName'] as String,
      countryCode: json['countryCode'] as String,
      continentCode: json['continentCode'] as String, 
      capital: json['capital'] as String, 
      population: json['population'] as Int32,
    );
  }
}