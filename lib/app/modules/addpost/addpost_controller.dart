import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/data/models/models.dart';

class AddPostController extends GetxController {
  var titleTextController = TextEditingController();
  var bodyTextController = TextEditingController();

  createNewPost() {
    Get.back(
      result: Post(
          id: 0,
          userId: 2,
          body: bodyTextController.text,
          title: titleTextController.text),
    );
  }
}
