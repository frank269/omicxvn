import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '/app/core/core.dart';
import '/app/data/constants/constant.dart';
import 'call_history_controller.dart';
import 'components/call_history_item.dart';

class CallHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: callHistoryColor,
        title: Text(
          TextConstants.callHistoryTitle,
          style: toolbarTextStyle,
        ),
      ),
      body: GetBuilder<CallHistoryController>(
        builder: (controller) => ListView.builder(
          controller: controller.scrollController,
          itemCount: controller.listHistory.length,
          itemBuilder: (context, index) {
            return CallHistoryItem(item: controller.listHistory[index]);
          },
        ),
      ),
    );
  }
}
