import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/contact_item.dart';
import '/app/core/core.dart';
import '/app/data/constants/constant.dart';
import '/app/modules/controllers.dart';

class ContactScreen extends StatelessWidget {
  bool loadMore(controller, scrollInfo) {
    if (!controller.isbusy &&
        scrollInfo.metrics.pixels > scrollInfo.metrics.maxScrollExtent * 0.9) {
      controller.loadMore();
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: contactsColor,
        title: Text(
          TextConstants.contactsTitle,
          style: toolbarTextStyle,
        ),
      ),
      body: GetBuilder<ContactsController>(
        builder: (controller) => NotificationListener<ScrollNotification>(
          child: ListView.builder(
            itemCount: controller.listContacts.length,
            itemBuilder: (context, index) {
              return ContactItem(item: controller.listContacts[index]);
            },
          ),
          onNotification: (notification) => loadMore(controller, notification),
        ),
      ),
    );
  }
}
