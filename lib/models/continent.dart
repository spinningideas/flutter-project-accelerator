class Continent {
  final String continentId;
  final String continentCode;
  final String continentName;

  Continent({this.continentId, this.continentCode, this.continentName});

  factory Continent.fromJson(Map<String, dynamic> json) {
    return new Continent(
      continentId: json['continentId'] as String,
      continentCode: json['continentCode'] as String,
      continentName: json['continentName'] as String,
    );
  }
}
