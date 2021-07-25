import 'package:get/get.dart';
import '/app/data/providers/shared_preferences_provider.dart';

class DbService extends GetxService {
  var provider = SharedPreferencesProvider();
  @override
  void onInit() async {
    super.onInit();
    await provider.init();
  }
}