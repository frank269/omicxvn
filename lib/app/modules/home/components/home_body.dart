import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller.dart';
import '/app/data/constants/constant.dart';

class HomeBody extends GetView<HomeController> {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          TextConstants.homeTitle,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('ADD'),
          onPressed: controller.toggleDialpad,
        ),
      ),
    );
  }
}
