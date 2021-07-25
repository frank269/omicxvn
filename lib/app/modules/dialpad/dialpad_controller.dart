import 'package:get/get.dart';

import 'dialpad_repository.dart';

class DialpadController extends GetxController {
  final DialpadRepository repository;
  DialpadController(this.repository);

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}
