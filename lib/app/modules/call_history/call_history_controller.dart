import 'package:get/get.dart';
import '/app/data/models/models.dart';
import '/app/data/services/db_service.dart';
import 'call_history_repository.dart';

class CallHistoryController extends GetxController {
  var _callHistoryRepository = CallHistoryRepository();
  var tenantID = Get.find<DbService>().currentUser?.tenantId ?? 0;
  var listHistory = <CallHistory>[].obs;
  var page = 1;
  var isbusy = false;

  loadData() async {
    isbusy = true;
    page = 1;
    listHistory.value = await _callHistoryRepository.getCallHistoryList(
        CallHistoryParam(cloudTenantId: tenantID, currentPage: page));
    update();
    isbusy = false;
  }

  loadMore() async {
    isbusy = true;
    var result = await _callHistoryRepository.getCallHistoryList(
        CallHistoryParam(cloudTenantId: tenantID, currentPage: page + 1));
    if (result.isNotEmpty) {
      listHistory.value.addAll(result);
      page += 1;
      update();
    }
    isbusy = false;
  }
}
