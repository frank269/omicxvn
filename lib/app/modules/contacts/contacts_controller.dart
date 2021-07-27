import 'package:get/get.dart';
import '/app/modules/contacts/contact_repository.dart';
import '/app/data/models/models.dart';

class ContactsController extends GetxController {
  var _contactRepository = ContactRepository();
  var listContacts = <Contact>[].obs;
  var skipCount = 0;
  var MAX = 20;
  var isbusy = false;

  loadData() async {
    isbusy = true;
    skipCount = 0;
    listContacts.value = await _contactRepository.getContactList(
        ContactParam(maxResultCount: MAX, skipCount: skipCount));
    update();
    isbusy = false;
  }

  loadMore() async {
    isbusy = true;
    var result = await _contactRepository.getContactList(
        ContactParam(maxResultCount: MAX, skipCount: skipCount + MAX));
    if (result.isNotEmpty) {
      listContacts.value.addAll(result);
      skipCount += MAX;
      update();
    }
    isbusy = false;
  }
}
