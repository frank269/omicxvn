import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omicxvn/app/data/models/models.dart';

class CallHistoryController extends GetxController {
  var scrollController = ScrollController();
  loadData() async {
    print('CallHistoryController loadData()');
  }

  var listHistory = [
    CallHistory('098588881', 1, '2021-07-23', '15:00:11'),
    CallHistory('123242132', 1, '2021-07-23', '15:00:11'),
    CallHistory('34352123', 1, '2021-07-23', '15:00:11'),
    CallHistory('0231812369', 1, '2021-07-23', '15:00:11'),
    CallHistory('12321123', 1, '2021-07-23', '15:00:11'),
    CallHistory('098588881', 1, '2021-07-23', '15:00:11'),
    CallHistory('123241231', 1, '2021-07-23', '15:00:11'),
    CallHistory('098588881', 1, '2021-07-23', '15:00:11'),
  ];
}
