import 'package:flutter/material.dart';
import '/app/data/models/models.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({Key? key, required this.item}) : super(key: key);
  final Contact item;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: ListTile(
          minLeadingWidth: 20,
          leading: Icon(
            Icons.account_circle_rounded,
            color: Colors.green,
            size: 40,
          ),
          title: Text(
            item.name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(item.phone),
        ),
      ),
    );
  }
}
