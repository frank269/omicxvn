import 'package:get/get.dart';

import 'call_history_api.dart';
import 'call_history_controller.dart';
import 'call_history_repository.dart';

class CallHistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CallHistoryController>(() => CallHistoryController());
  }
}
