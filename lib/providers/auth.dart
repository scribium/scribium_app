import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:scribium_app/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:scribium_app/utilities/constants.dart';

class Auth with ChangeNotifier {
  User? _user;
  User? get user => _user;

  Future<AuthStatus> loginUser(String email, String password) async {
    //TODO: Add user login sequence function

    // Map loginData = {
    //   'email': 'donald.kostecki@hotmail.com',
    //   'password': 'pass123'
    // };

    const String url = Constants.debugMode
        ? Constants.localBackendAddress
        : Constants.externalBackendAddress;

    //HACK: Leave 1500 miliseconds delay, in case if someone started spamming requests.
    return Future.delayed(const Duration(milliseconds: 1500), () async {
      Map loginData = {
        'email': email,
        'password': password,
      };

      String encodedData = json.encode(loginData);

      // Receiving JWT token

      http.Response? jwtResponse = await http
          .post(
            Uri.parse('$url/auth/login'),
            body: encodedData,
            headers: {"Content-Type": "application/json"},
            encoding: Encoding.getByName("utf-8"),
          )
          .timeout(const Duration(milliseconds: 1000))
          .onError((error, stackTrace) => http.Response("", 400));

      if (jwtResponse.statusCode == 200) {
        Map<String, dynamic> decodedBody = json.decode(jwtResponse.body);

        // Getting user information

        http.Response response = await http.get(
          Uri.parse('$url/me'),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${decodedBody["token"]}",
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
          details: UserDetails(
            name: userData["details"]["firstName"] ?? "",
            lastName: userData["details"]["lastName"] ?? "",
            email: userData["email"],
            address: userData["details"]["address"],
            phone: int.parse(userData["details"]["phone"]),
          ),
          role: roles,
        );

        return AuthStatus.logged;
      }

      return AuthStatus.error;
    });
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