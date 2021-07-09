import 'package:uuid/uuid.dart';
import '../../authentication/models/user.dart';

class UserRepository {
  User? _user;
  Future<User?> getUser() async {
    if (_user != null) return _user;
    return Future.delayed(
        const Duration(seconds: 1), () => _user = User(Uuid().v4()));
  }
}
