import 'package:injectable/injectable.dart';
import 'package:omicxvn/constant/constant.dart';
import 'package:omicxvn/interfaces/ITicketRepository.dart';
import 'package:omicxvn/models/Ticket.dart';
import 'package:omicxvn/models/param/TicketParam.dart';
import 'package:omicxvn/notifiers/auth_notifier.dart';
import 'package:omicxvn/utils/ApiUtils.dart';
import 'dart:convert' as convert;

import 'package:omicxvn/utils/base_controller.dart';

@Singleton(as: ITicketRepository, env: [Environment.dev])
class DevTicketRepository with BaseController implements ITicketRepository {
  get headers => {
        "Authorization": "Bearer " + AuthNotifier.authenToken,
        "abp.tenantid": "23",
        "Content-Type": "application/json"
      };

  @override
  Future<List<Ticket>> getTicket(TicketParam ticketParam) async {
    var response = await ApiUtils.sendPost(
      base: BASE_API,
      path: TICKET_LOAD_PATH,
      headers: headers,
      body: ticketParam.toJson(),
    ).catchError(handleError);
    if (response != null) {
      var body = convert.jsonDecode(response);
      if (body['success']) {
        var data = body['result'];
        return List.from(data['items'])
            .map<Ticket>((ticket) => Ticket.fromMap(ticket))
            .toList();
      }
    }
    return List<Ticket>.empty();
  }

  @override
  Future<Ticket> getDetailTicket(int id) async {
    var response = await ApiUtils.sendGet(
        base: BASE_API,
        path: TICKET_DETAIL_PATH,
        headers: headers,
        params: {"id": "$id"}).catchError(handleError);
    if (response != null) {
      var body = convert.jsonDecode(response);
      if (body['success']) {
        var data = body['result'];
        return Ticket.fromMap(data);
      }
    }
    return Ticket();
  }
}
