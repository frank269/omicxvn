import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/contact_item.dart';
import '/app/core/core.dart';
import '/app/data/constants/constant.dart';
import '/app/modules/controllers.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

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
        builder: (controller) => ListView.builder(
          controller: controller.scrollController,
          itemCount: controller.listContacts.length,
          itemBuilder: (context, index) {
            return ContactItem(item: controller.listContacts[index]);
          },
        ),
      ),
    );
  }
}
