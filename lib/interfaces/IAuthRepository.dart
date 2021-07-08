import 'package:omicxvn/models/AuthResponse.dart';

abstract class IAuthRepository {
  Future<AuthResponse?> login(String username, String password);
}
