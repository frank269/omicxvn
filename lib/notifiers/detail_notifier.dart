import 'package:flutter/foundation.dart';

class DetailNotifier with ChangeNotifier {
  int count = 0;

  increaseCount() {
    count += 1;
    notifyListeners();
  }

  decreaseCount() {
    count -= 1;
    notifyListeners();
  }

  setCount(int _count) {
    count = _count;
    notifyListeners();
  }
}
