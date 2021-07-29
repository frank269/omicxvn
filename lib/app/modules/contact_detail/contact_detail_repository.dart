import 'package:omicxvn/app/core/core.dart';
import 'package:omicxvn/app/data/constants/constant.dart';
import 'package:omicxvn/app/data/models/models.dart';
import 'package:omicxvn/app/data/services/repository.dart';

class ContactDetailRepository with BaseController implements BaseRepository {
  Future<ContactDetail> getContactDetail(ContactDetailParam param) async {
    var response = await ApiUtils.sendGet(
      base: ApiConstants.BASE_API,
      path: ApiConstants.CONTACT_BY_ID_PATH,
      headers: headers,
      params: param.toMap(),
    ).catchError(handleError);
    if (response != null) {
      if (response['success']) {
        var data = response['result'];
        return ContactDetail.fromMap(data);
      }
    }
    return ContactDetail();
  }
}
