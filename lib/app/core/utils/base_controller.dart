import '../core.dart';
import 'app_exceptions.dart';

class BaseController {
  void handleError(error) {
    hideLoading();
    if (error is BadRequestException) {
      showToast('Đã có lỗi xảy ra, kiểm tra lại internet!');
    } else if (error is FetchDataException) {
      showToast(error.message ?? 'Đã có lỗi xảy ra, kiểm tra lại internet!');
    } else if (error is UnAuthorizedException) {
      showToast('Token hết hạn, đăng nhập lại để tiếp tục!');
    } else if (error is ApiNotRespondingException) {
      showToast(error.message ?? 'Đã có lỗi xảy ra, kiểm tra lại internet!');
    } else if (error is Exception) {
      showToast('Đã có lỗi xảy ra, kiểm tra lại internet!');
    }
  }

  void showToast(String message) {
    DialogHelper.showToast(message: message);
  }

  void showLoading([String message = 'Loading ...']) {
    DialogHelper.showLoading(message);
  }

  void hideLoading() {
    DialogHelper.hideLoading();
  }
}
