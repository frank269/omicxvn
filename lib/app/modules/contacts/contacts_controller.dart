import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/data/models/models.dart';

class ContactsController extends GetxController {
  var scrollController = ScrollController();
  loadData() async {}

  var listContacts = [
    Contact('1242341234', 'So 1'),
    Contact('0985883881', 'Đoàn văn A'),
    Contact('123223513235', 'Nguyễn văn K'),
    Contact('12352531', 'So 1'),
    Contact('2313123', 'Một hai ba'),
    Contact('1345125123', 'So 1'),
    Contact('0985883881', 'So 1'),
    Contact('12342341234', 'Phạm minh chính'),
  ];
}
