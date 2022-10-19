import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScribiumColors {
  // LIGHT THEME
  static const darkPurple = Color.fromRGBO(53, 24, 90, 1);
  static const lightPurple = Color.fromRGBO(153, 138, 171, 1);
}

class ScribiumSystemUiOverlayStyle {

  // TODO: In a future add different themes.
  // LIGHT MODE

  static SystemUiOverlayStyle light = SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white.withOpacity(0.01),
    statusBarColor: Colors.white.withOpacity(0.01),
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
  );
}
