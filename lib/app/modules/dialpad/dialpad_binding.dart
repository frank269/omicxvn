import 'package:get/get.dart';

import 'dialpad_api.dart';
import 'dialpad_controller.dart';
import 'dialpad_repository.dart';

class DialpadBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DialpadController>(
        () => DialpadController(DialpadRepository(DialpadApi())));
  }
}
