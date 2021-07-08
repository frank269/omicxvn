import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:omicxvn/injection/injection.dart';
import 'package:omicxvn/interfaces/IAuthRepository.dart';
import 'package:omicxvn/models/AuthResponse.dart';

enum AuthState { success, failed, none }

class AuthNotifier extends ChangeNotifier {
  static String authenToken = '';
  AuthState authState = AuthState.none;
  AuthResponse? currentUser = null;

  Future<AuthState> login(String username, String password) async {
    currentUser = await getIt<IAuthRepository>().login(username, password);
    if (currentUser == null) {
      authState = AuthState.failed;
      notifyListeners();
    } else {
      authenToken = currentUser!.accessToken;
      authState = AuthState.success;
      notifyListeners();
    }
    return authState;
  }
}
