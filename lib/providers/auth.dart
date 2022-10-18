import 'package:flutter/cupertino.dart';
import 'package:scribium_app/models/user.dart';

class Auth with ChangeNotifier {
  User? _user;
  User? get user => _user;

  Future<AuthStatus> loginUser(String email, String password) async {
    //TODO: Add user login sequence function
    //HACK: Leave 1500 miliseconds delay, in case if someone started spamming requests.
    
    await Future.delayed(const Duration(milliseconds: 2000), () {
      return AuthStatus.logged;
    }).onError(
      (error, stackTrace) => AuthStatus.error,
    );

    return AuthStatus.error;
  }

  bool isLogged() {
    return _user != null;
  }
}

enum AuthStatus {
  wrongPassword,
  wrongEmail,
  logged,
  error,
}
