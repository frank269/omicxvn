import 'package:omicxvn/utils/app_exceptions.dart';
import 'package:omicxvn/utils/dialog_helper.dart';

class BaseController {
  void handleError(error) {
    hideLoading();
    if (error is BadRequestException) {
      DialogHelper.showErrorDialog(
          description: error.message ?? 'Some thing went wrong');
    } else if (error is FetchDataException) {
      DialogHelper.showErrorDialog(
          description: error.message ?? 'Some thing went wrong');
    } else if (error is ApiNotRespondingException) {
      DialogHelper.showErrorDialog(
          description: 'Oops! It took longer to response.');
    }
  }

  void showLoading([String message = 'Loading ...']) {
    DialogHelper.showLoading(message);
  }

  void hideLoading() {
    DialogHelper.hideLoading();
  }
}
