import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ApiUtils {
  static final client = http.Client();

  static Future<http.Response> sendGet({
    required String base,
    required String path,
    Map<String, String> headers = const {},
    Map<String, String>? params,
    bool isHttps = true,
  }) {
    return client.get(
        isHttps == true
            ? Uri.https(base, path, params)
            : Uri.http(base, path, params),
        headers: headers);
  }

  static Future<http.Response> sendPost({
    required String base,
    required String path,
    Map<String, String> headers = const {},
    required dynamic body,
    bool isHttps = true,
  }) {
    return client.post(
        isHttps == true ? Uri.https(base, path) : Uri.http(base, path),
        headers: headers,
        body: body);
  }
}
