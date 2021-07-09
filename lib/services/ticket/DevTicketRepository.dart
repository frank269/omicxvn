import 'package:injectable/injectable.dart';
import 'package:omicxvn/constant/constant.dart';
import 'package:omicxvn/interfaces/ITicketRepository.dart';
import 'package:omicxvn/models/Ticket.dart';
import 'package:omicxvn/models/param/TicketParam.dart';
import 'package:omicxvn/notifiers/auth_notifier.dart';
import 'package:omicxvn/utils/ApiUtils.dart';
import 'dart:convert' as convert;

@Singleton(as: ITicketRepository, env: [Environment.dev])
class DevTicketRepository implements ITicketRepository {
  @override
  Future<List<Ticket>> getTicket(TicketParam ticketParam) async {
    var headers = {
      "Authorization": "Bearer " + AuthNotifier.authenToken,
      "abp.tenantid": "23",
      "Content-Type": "application/json"
    };
    var response = await ApiUtils.sendPost(
      base: BASE_API,
      path: TICKET_LOAD_PATH,
      headers: headers,
      body: ticketParam.toJson(),
    );
    if (response.statusCode == 200) {
      var body = convert.jsonDecode(convert.utf8.decode(response.bodyBytes));
      if (body['success']) {
        var data = body['result'];
        return List.from(data['items'])
            .map<Ticket>((ticket) => Ticket.fromJson(ticket))
            .toList();
      } else
        return List<Ticket>.empty();
    } else
      return List<Ticket>.empty();
  }
}
