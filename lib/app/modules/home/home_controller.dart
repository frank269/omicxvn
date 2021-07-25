import 'package:get/get.dart';
import 'package:sip_ua/sip_ua.dart';
import '../controllers.dart';
import '/app/routes/pages.dart';

class HomeController extends GetxController implements SipUaHelperListener {
  var isShowDialpad = true.obs;
  var selectedPageIndex = 0;

  HomeController() {
    Get.find<DashboardController>().loadData();
  }

  changeIndex(int index) {
    if (index == selectedPageIndex) return;
    selectedPageIndex = index;
    switch (index) {
      case 0:
        //load dashboard
        Get.find<DashboardController>().loadData();
        break;
      case 1:
        //load call history
        Get.find<CallHistoryController>().loadData();
        break;
      case 2:
        //load call history
        Get.find<ContactsController>().loadData();
        break;
      case 3:
        //load tickets
        Get.find<TicketController>().loadData();
        break;
    }
    update();
  }

  toggleDialpad() {
    isShowDialpad.value = !isShowDialpad.value;
    update();
  }

  gotoDialpad() {
    Get.toNamed(Routes.DIALPAD);
  }

  @override
  void callStateChanged(Call call, CallState state) {
    // TODO: implement callStateChanged
  }

  @override
  void onNewMessage(SIPMessageRequest msg) {
    // TODO: implement onNewMessage
  }

  @override
  void registrationStateChanged(RegistrationState state) {
    // TODO: implement registrationStateChanged
  }

  @override
  void transportStateChanged(TransportState state) {
    // TODO: implement transportStateChanged
  }
}
