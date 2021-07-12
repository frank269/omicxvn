import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:omicxvn/constant/constant.dart';
import 'package:omicxvn/interfaces/IAuthRepository.dart';
import 'package:omicxvn/models/AuthResponse.dart';
import 'package:omicxvn/models/param/AuthRequest.dart';
import 'package:omicxvn/utils/ApiUtils.dart';
import 'package:omicxvn/utils/base_controller.dart';

@Singleton(as: IAuthRepository, env: [Environment.dev])
class DevAuthRepository with BaseController implements IAuthRepository {
  @override
  Future<AuthResponse?> login(String username, String password) async {
    showLoading('Đăng nhập ...');
    var authRequest =
        AuthRequest(userNameOrEmailAddress: username, password: password);
    var response = await ApiUtils.sendPost(
        base: BASE_API,
        path: AUTHENTICATE_PATH,
        body: authRequest.toJson(),
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
          'Abp.TenantId': '23',
        }).catchError(handleError);
    if (response != null) {
      hideLoading();
      var body = jsonDecode(response);
      if (body['success']) {
        var result = body['result'];
        var authResponse = AuthResponse.fromMap(result);
        return authResponse;
      }
    }
    return null;
  }
}
