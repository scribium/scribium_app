import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scribium_app/helpers/custom_route.dart';

class Constants {
  static const appName = "Scribium";
  static const debugMode = true;

  static const localBackendAddress = "http://10.0.2.2:3000";
  static const externalBackendAddress = "http://10.0.2.2:3000"; //TODO: Change external backend address
}

class ScribiumThemes {
  static ThemeData light = ThemeData(
    backgroundColor: Colors.white,
    primaryColor: ScribiumColors.darkPurple,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: ScribiumColors.darkPurple,
        fontFamily: "Yeseva One",
      ),
      titleMedium: TextStyle(
        color: ScribiumColors.darkPurple,
        fontFamily: "Archivo",
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        color: Colors.grey,
        fontFamily: "Archivo",
        fontWeight: FontWeight.w200,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(
          ScribiumColors.lightPurple,
        ),
        foregroundColor: MaterialStateProperty.all(
          ScribiumColors.darkPurple,
        ),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
      ),
    ),
    iconTheme: const IconThemeData(
      color: ScribiumColors.darkPurple,
      size: 30,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ScribiumColors.darkPurple,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      focusColor: ScribiumColors.darkPurple,
      prefixIconColor: ScribiumColors.darkPurple,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: ScribiumColors.lightPurple,
        ),
      ),
      suffixIconColor: ScribiumColors.darkPurple,
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: ScribiumColors.darkPurple,
        ),
      ),
    ),
    shadowColor: Colors.black.withOpacity(0.1),
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: ScribiumColors.darkPurple,
    ),
    pageTransitionsTheme: PageTransitionsTheme(builders: {
      TargetPlatform.android: CustomTransition(),
    }),
  );
}

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
