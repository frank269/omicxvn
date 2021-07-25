import 'package:get/get.dart';

import '/app/data/models/models.dart';
import '../../data/services/services.dart';
import '/app/routes/pages.dart';

class UserProfileController extends GetxController {
  var currentUser = User(
    'Diễm Lê Thị',
    'diemlt@ecopark.vn',
    'false',
    '1985-07-21',
    '012351423',
    'Lê Đức Thọ, Hà Nội',
    'admin admin',
    'Agent',
    '1',
  );
  final DbService _dbService = Get.find<DbService>();

  logout() {
    _dbService.provider.logOut();
    Get.offNamed(Routes.LOGIN);
  }
}
