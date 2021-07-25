import 'package:get/get.dart';

import '/app/core/core.dart';
import '/app/data/constants/constant.dart';
import '/app/data/models/models.dart';
import '/app/data/services/repository.dart';
import '/app/data/services/services.dart';

class TicketsRepository with BaseController implements BaseRepository {
  var dbService = Get.find<DbService>();
  get headers => {
        "Authorization": "Bearer " + dbService.provider.getAuthToken(),
        "abp.tenantid": "24",
        "Content-Type": "application/json"
      };

  Future<List<Ticket>> getTicket(TicketParam ticketParam) async {
    var response = await ApiUtils.sendPost(
      base: ApiConstants.BASE_API,
      path: ApiConstants.TICKET_LOAD_PATH,
      headers: headers,
      body: ticketParam.toJson(),
    ).catchError(handleError);
    if (response != null) {
      if (response['success']) {
        var data = response['result'];
        return List.from(data['items'])
            .map<Ticket>((ticket) => Ticket.fromMap(ticket))
            .toList();
      }
    }
    return List<Ticket>.empty();
  }

  Future<Ticket> getDetailTicket(int id) async {
    var response = await ApiUtils.sendGet(
        base: ApiConstants.BASE_API,
        path: ApiConstants.TICKET_DETAIL_PATH,
        headers: headers,
        params: {"id": "$id"}).catchError(handleError);
    if (response != null) {
      if (response['success']) {
        var data = response['result'];
        return Ticket.fromMap(data);
      }
    }
    return Ticket();
  }
}