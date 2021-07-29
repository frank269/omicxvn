import 'package:omicxvn/app/core/core.dart';
import 'package:omicxvn/app/data/constants/constant.dart';
import 'package:omicxvn/app/data/models/models.dart';
import 'package:omicxvn/app/data/services/repository.dart';

class ApiProvider {}

class CallApiRepository with BaseController implements BaseRepository {
  Future<ContactHistoryResponse> createContactHistory(
      CreateContactHistory body) async {
    var response = await ApiUtils.sendPost(
      base: ApiConstants.BASE_API,
      path: ApiConstants.CREATE_CONTACT_HISTORY_PATH,
      headers: headers,
      body: body.toJson(),
    ).catchError(handleError);
    if (response != null) {
      if (response['success']) {
        var data = response['result'];
        return ContactHistoryResponse.fromMap(data);
      }
    }
    return ContactHistoryResponse();
  }

  Future<bool> changeMisstoOutbound(ChangeMissToOutBoundRequest body) async {
    var response = await ApiUtils.sendPost(
      base: ApiConstants.BASE_API,
      path: ApiConstants.CREATE_CONTACT_HISTORY_PATH,
      headers: headers,
      body: body.toJson(),
    ).catchError(handleError);
    if (response != null) {
      if (response['success']) {
        return true;
      }
    }
    return false;
  }

  Future<bool> updateContactHistory(UpdateContactHistoryRequest body) async {
    var response = await ApiUtils.sendPut(
      base: ApiConstants.BASE_API,
      path: ApiConstants.UPDATE_CONTACT_HISTORY_PATH,
      headers: headers,
      body: body.toJson(),
    ).catchError(handleError);
    if (response != null) {
      if (response['success']) {
        return true;
      }
    }
    return false;
  }

  Future<bool> createInteractCard(CreateInteractCardRequest body) async {
    var response = await ApiUtils.sendPost(
      base: ApiConstants.BASE_API,
      path: ApiConstants.CREATE_CONTACT_HISTORY_PATH,
      headers: headers,
      body: body.toJson(),
    ).catchError(handleError);
    if (response != null) {
      if (response['success']) {
        return true;
      }
    }
    return false;
  }
}
