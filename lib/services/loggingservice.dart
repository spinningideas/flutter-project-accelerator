import 'dart:developer' as developer;
import 'dart:convert';

class LoggingService {
  void log(String message, String category) {
    developer.log(message, name: category);
  }

  void logJson(String message, String category, Object data) {
    developer.log(
      'log me',
      name: 'my.app.category',
      error: jsonEncode(data),
    );
  }
}
