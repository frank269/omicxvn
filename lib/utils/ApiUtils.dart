import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ApiUtils {
  static final String root_api = "https://omicx.vn/";

  static final client = http.Client();
  static Future<http.Response> sendGet(
      String url, Map<String, String> headers) {
    return client.get(Uri.parse(url), headers: headers);
  }

  static Future<http.Response> sendPost(
      String url, dynamic body, Map<String, String> headers) {
    return client.post(Uri.parse(url),
        headers: headers, body: convert.jsonEncode(body));
  }
}
