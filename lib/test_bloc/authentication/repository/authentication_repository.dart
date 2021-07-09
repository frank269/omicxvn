import 'dart:async';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controler = StreamController<AuthenticationStatus>();
  Stream<AuthenticationStatus> get status async* {
    await Future.delayed(const Duration(seconds: 10));
    yield AuthenticationStatus.unauthenticated;
    yield* _controler.stream;
  }

  Future<void> logIn(
      {required String username, required String password}) async {
    await Future.delayed(Duration(seconds: 1),
        () => _controler.add(AuthenticationStatus.authenticated));
  }

  void logOut() {
    _controler.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controler.close();
}
