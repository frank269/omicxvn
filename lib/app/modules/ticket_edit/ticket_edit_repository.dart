import 'package:omicxvn/app/core/core.dart';
import 'package:omicxvn/app/data/constants/constant.dart';
import 'package:omicxvn/app/data/models/models.dart';
import 'package:omicxvn/app/data/services/repository.dart';

class TicketEditRepository with BaseController implements BaseRepository {
  Future<bool> editTicket(UpdateTicketParam param) async {
    var response = await ApiUtils.sendPut(
      base: ApiConstants.BASE_API,
      path: ApiConstants.UPDATE_DETAIL_TICKET_PATH,
      headers: headers,
      body: param.toJson(),
    ).catchError(handleError);
    if (response != null) {
      if (response['success']) {
        return true;
      }
    }
    return false;
  }
}
