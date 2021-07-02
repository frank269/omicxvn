import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class BaseSevice {
  static final client = http.Client();
  static Future<http.Response> sendGetRequest(
      String url, Map<String, String> headers) {
    return client.get(Uri.parse(url), headers: headers);
  }

  static Future<http.Response> sendPostRequest(
      String url, dynamic body, Map<String, String> headers) {
    return client.post(Uri.parse(url),
        headers: headers, body: convert.jsonEncode(body));
  }
}
