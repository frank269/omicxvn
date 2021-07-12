import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  static void showErrorDialog({
    String title = 'Error',
    String description = 'Someting went wrong!',
  }) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Get.textTheme.headline4,
              ),
              Text(
                description,
                style: Get.textTheme.headline6,
              ),
              ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen ?? false) Get.back();
                },
                child: const Text('okey'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void showSnackbar({
    String title = 'Error',
    String description = 'Someting went wrong!',
  }) {
    Get.snackbar(title, description);
  }

  static void showLoading([String message = 'Loading ...']) {
    Get.dialog(
        Dialog(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(
                  height: 8,
                ),
                Text(message),
              ],
            ),
          ),
        ),
        barrierDismissible: false);
  }

  static void hideLoading() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }
}
