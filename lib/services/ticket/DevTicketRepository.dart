import 'package:injectable/injectable.dart';
import 'package:omicxvn/interfaces/ITicketRepository.dart';
import 'package:omicxvn/models/Ticket.dart';
import 'package:omicxvn/utils/ApiUtils.dart';
import 'dart:convert' as convert;

@Singleton(as: ITicketRepository, env: [Environment.dev])
final String LOAD_TICKET =
    ApiUtils.root_api + "api/services/app/Ticket/LoadTicket";

class DevTicketRepository implements ITicketRepository {
  @override
  Future<List<Ticket>> getTicket(int skipCount, int maxResult) async {
    var response = await ApiUtils.sendPost(LOAD_TICKET, {
      "skipCount": skipCount,
      "maxResultCount": maxResult,
      "ticketFilterField": {"campaigns": [], "groupProcessing": []}
    }, {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjkiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiZGllbWx0IiwiQXNwTmV0LklkZW50aXR5LlNlY3VyaXR5U3RhbXAiOiI1VE5ESTZHN0FETVJCVDU2VU0zVVQ2S0dESzZHSEQzRSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlN1cGVydmlzb3IiLCJodHRwOi8vd3d3LmFzcG5ldGJvaWxlcnBsYXRlLmNvbS9pZGVudGl0eS9jbGFpbXMvdGVuYW50SWQiOiIyMyIsInN1YiI6IjkiLCJqdGkiOiIzYzVlZjUwMy1mY2Y1LTRlYzYtYmRhOS0yYmIxZWE5MDBmYmYiLCJpYXQiOjE2MjU2MjM4OTEsIm5iZiI6MTYyNTYyMzg5MSwiZXhwIjoxNjI1NzEwMjkxLCJpc3MiOiJBZG1pbiIsImF1ZCI6IkFkbWluIn0.OOuih8n0qQIQqQLYk9wwA18ooVKhd-jxJHuq_CFCAgE",
      "abp.tenantid": "23",
      "Content-Type": "application/json"
    });
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
