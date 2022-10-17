import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:scribium_app/screens/intro_screen.dart';
import 'package:scribium_app/screens/login_screen.dart';
import 'package:scribium_app/screens/register_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Orientation lock
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  // Navigation bar settings
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: Add multiprovider, with one changenotifier storing theme settings.

    return MaterialApp(
      title: "Scribium App",
      // Themes set
      theme: ThemeData(
        backgroundColor: Colors.white,
        primaryColor: const Color.fromRGBO(53, 24, 90, 1),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Color.fromRGBO(53, 24, 90, 1),
            fontFamily: "Yeseva",
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
                const Color.fromRGBO(153, 138, 171, 1)),
            foregroundColor:
                MaterialStateProperty.all(Color.fromRGBO(53, 24, 90, 1)),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
          ),
        ),
        iconTheme: const IconThemeData(color: Color.fromRGBO(53, 24, 90, 1)),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color.fromRGBO(53, 24, 90, 1),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: Color.fromRGBO(53, 24, 90, 1),
          prefixIconColor: Color.fromRGBO(53, 24, 90, 1),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(153, 138, 171, 1)),
          ),
          suffixIconColor: Color.fromRGBO(53, 24, 90, 1),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(53, 24, 90, 1)),
          ),
        ),
      ),
      darkTheme: ThemeData(
        backgroundColor: Colors.grey,
      ),
      highContrastTheme: ThemeData(
        backgroundColor: Colors.white,
      ),
      highContrastDarkTheme: ThemeData(
        backgroundColor: Colors.black,
      ),

      debugShowCheckedModeBanner: false,

      // Route management
      initialRoute: IntroScreen.routeName,
      onUnknownRoute: (settings) => MaterialPageRoute<void>(
        settings: settings,
        builder: (context) => const IntroScreen(),
      ),
      routes: {
        IntroScreen.routeName: (context) => const IntroScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
      },
    );
  }
}
