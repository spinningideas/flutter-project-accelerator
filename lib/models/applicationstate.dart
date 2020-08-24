class ApplicationState {
  final String localeCode;
  final Map<String, String> supportedLocales;
  final Map<String, String> localizedData;

  ApplicationState(
      {this.localeCode, this.supportedLocales, this.localizedData});
}
