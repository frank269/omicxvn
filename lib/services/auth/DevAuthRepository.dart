import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:omicxvn/constant/constant.dart';
import 'package:omicxvn/interfaces/IAuthRepository.dart';
import 'package:omicxvn/models/AuthResponse.dart';
import 'package:omicxvn/models/param/AuthRequest.dart';
import 'package:omicxvn/utils/ApiUtils.dart';

@Singleton(as: IAuthRepository, env: [Environment.dev])
class DevAuthRepository implements IAuthRepository {
  @override
  Future<AuthResponse?> login(String username, String password) async {
    var authRequest =
        AuthRequest(userNameOrEmailAddress: username, password: password);

    var response = await ApiUtils.sendPost(
        base: BASE_API,
        path: AUTHENTICATE_PATH,
        body: authRequest.toJson(),
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
          'Abp.TenantId': '23',
        });
    if (response.statusCode == 200) {
      var body = jsonDecode(utf8.decode(response.bodyBytes));
      if (body['success']) {
        var result = body['result'];
        var authResponse = AuthResponse.fromMap(result);
        return authResponse;
      }
    }
    return null;
  }
}
