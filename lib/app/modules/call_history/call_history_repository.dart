import '/app/core/core.dart';
import '/app/data/constants/constant.dart';
import '/app/data/services/repository.dart';

class CallHistoryRepository with BaseController implements BaseRepository {
  
  // Future<AuthResponse?> getCallHistory(String username, String password,token) async {
  //   var authRequest =
  //       AuthRequest(userNameOrEmailAddress: username, password: password);
  //   var response = await ApiUtils.sendPost(
  //       base: ApiConstants.BASE_API,
  //       path: ApiConstants.CALL_HISTORY_PATH,
  //       body: authRequest.toJson(),
  //       headers: {
  //         'Content-type': 'application/json; charset=UTF-8',
  //         'Abp.TenantId': '24',
  //       }).catchError(handleError);
  //   if (response != null) {
  //     if (response['success']) {
  //       var result = response['result'];
  //       var authResponse = AuthResponse.fromMap(result);
  //       return authResponse;
  //     }
  //   }
  //   return null;
  // }
}