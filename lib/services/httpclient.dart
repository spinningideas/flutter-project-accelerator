import 'dart:convert';
import 'package:http/http.dart';

class HttpClient {
  Future<Map<String, dynamic>> get(String url) async {
    Response response = await get(url);
    String json = response.body;
    Map<String, dynamic> map = jsonDecode(json);
    return map;
  }

  Future<void> post(String url, String jsonPostData) async {
    Map<String, String> headers = {'Content-type': 'application/json'};
    await post(url, headers: headers, body: jsonPostData);
  }
}
