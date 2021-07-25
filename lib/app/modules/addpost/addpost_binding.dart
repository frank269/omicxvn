import 'package:get/get.dart';

import 'addpost_controller.dart';

class AddPostBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPostController>(() => AddPostController());
  }
}
