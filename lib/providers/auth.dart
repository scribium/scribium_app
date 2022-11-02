import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:scribium_app/models/user.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  User? _user;
  User? get user => _user;

  Future<AuthStatus> loginUser(String email, String password) async {
    //TODO: Add user login sequence function
    //HACK: Leave 1500 miliseconds delay, in case if someone started spamming requests.
    // Map loginData = {
    //   'email': 'donald.kostecki@hotmail.com',
    //   'password': 'pass123'
    // };

    Map loginData = {
      'email': email,
      'password': password,
    };

    String encodedData = json.encode(loginData);

    // Receiving JWT token

    http.Response jwtResponse = await http.post(
      Uri.parse('http://10.0.2.2:3000/auth/login'),
      body: encodedData,
      headers: {"Content-Type": "application/json"},
      encoding: Encoding.getByName("utf-8"),
    );

    if (jwtResponse.statusCode == 200) {
      Map<String, dynamic> decodedBody = json.decode(jwtResponse.body);

      // Getting user information

      http.Response response = await http.get(
        Uri.parse('http://10.0.2.2:3000/me'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer " + decodedBody["token"],
        },
      );

      Map<String, dynamic> userData = json.decode(response.body);
      print(userData);

      List<UserRole> roles = [];
      for (String role in userData["roles"]) {
        for (UserRole e in UserRole.values) {
          {
            if (role.toLowerCase() == e.name.toLowerCase()) {
              roles.add(UserRole.values.byName(e.name));
            }
          }
        }
      }

      _user = User(
        decodedBody["token"]!,
        name: userData["details"]["firstName"] ?? "",
        lastName: userData["details"]["lastName"] ?? "",
        email: userData["email"],
        role: roles,
        address: userData["details"]["address"],
        phone: int.parse(userData["details"]["phone"]),
      );

      return AuthStatus.logged;
    }

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
