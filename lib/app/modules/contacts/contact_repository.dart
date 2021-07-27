import '/app/data/constants/constant.dart';

import '/app/data/models/models.dart';

import '/app/data/services/repository.dart';
import '/app/core/core.dart';

class ContactRepository with BaseController implements BaseRepository {

  Future<List<Contact>> getContactList(ContactParam params) async {
    var response = await ApiUtils.sendPost(
      base: ApiConstants.BASE_API,
      path: ApiConstants.CONTACT_LIST_PATH,
      headers: headers,
      body: params.toJson(),
    ).catchError(handleError);
    if (response != null) {
      if (response['success']) {
        var data = response['result'];
        var items = data['items'];
        if (items == []) {
          return List<Contact>.empty();
        }
        return List.from(items)
            .map<Contact>((contact) => Contact.fromMap(contact))
            .toList();
      }
    }
    return List<Contact>.empty();
  }

  // Future<Ticket> getDetailTicket(int id) async {
  //   var response = await ApiUtils.sendGet(
  //       base: ApiConstants.BASE_API,
  //       path: ApiConstants.TICKET_DETAIL_PATH,
  //       headers: headers,
  //       params: {"id": "$id"}).catchError(handleError);
  //   if (response != null) {
  //     if (response['success']) {
  //       var data = response['result'];
  //       return Ticket.fromMap(data);
  //     }
  //   }
  //   return Ticket();
  // }
}
