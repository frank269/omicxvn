import 'package:flutter/material.dart';
import '/app/data/models/models.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const <int, TableColumnWidth>{
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(2),
      },
      children: [
        buildRow('Họ và tên:', user.fullname),
        buildRow('Địa chỉ Email:', user.email),
        buildRow('Giới tính:', user.sex),
        buildRow('Ngày sinh:', user.birthday),
        buildRow('Số điện thoại:', user.phonenumber),
        buildRow('Địa chỉ:', user.addresses),
        buildRow('Người tạo:', user.suppervisor),
        buildRow('Vai trò:', user.role),
        buildRow('Cấp bậc:', user.level),
      ],
    );
  }

  buildRow(title, value) => TableRow(
        children: [
          Container(
            height: 30,
            child: Text(title),
          ),
          Container(
            height: 20,
            child: Text(value),
          ),
        ],
      );
}
