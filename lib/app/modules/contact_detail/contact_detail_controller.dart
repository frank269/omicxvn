import 'package:get/get.dart';
import 'package:omicxvn/app/data/models/models.dart';
import 'package:omicxvn/app/modules/contacts/contacts_controller.dart';
import 'package:omicxvn/app/routes/pages.dart';

import 'contact_detail_repository.dart';

class ContactDetailController extends GetxController {
  final _contactDetailRepository = ContactDetailRepository();
  var contactDetail = ContactDetail();
  ContactDetailController() {
    var contact = Get.find<ContactsController>().contactItem;
    loadData(contact.id ?? 0);
  }

  loadData(int id) async {
    contactDetail = await _contactDetailRepository
        .getContactDetail(ContactDetailParam(id: id));
    update();
  }

  editContact() {
    Get.toNamed(Routes.CONTACT_EDIT);
  }
}
