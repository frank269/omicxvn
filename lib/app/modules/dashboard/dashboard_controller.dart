import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/data/models/models.dart';

class DashboardController extends GetxController {
  loadData() async {
    print('DashboardController loadData()');
  }

  var selectedPageIndex = 0.obs;
  var pageController = PageController();

  List<DashboardItem> dashboardPages = [
    DashboardItem(
      '10',
      '12',
      '1',
      '0',
    ),
    DashboardItem(
      '11',
      '12',
      '15',
      '2',
    ),
    DashboardItem(
      '3',
      '4',
      '2',
      '3',
    ),
  ];
}
