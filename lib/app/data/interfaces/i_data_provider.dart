import '/app/data/models/models.dart';

abstract class IDataProvider {
  init();
  UserRequest getSavedUser();
  String getAuthToken();
  saveUserRequest(UserRequest user);
  saveAuthToken(String token);
}
