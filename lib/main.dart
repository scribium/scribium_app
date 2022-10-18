import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:scribium_app/constants.dart';
import 'package:scribium_app/providers/auth.dart';
import 'package:scribium_app/screens/intro_screen.dart';
import 'package:scribium_app/screens/login_screen.dart';


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

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Auth(),
        ),
      ],
      child: MaterialApp(
        title: "Scribium App",
        // Themes set
        theme: ThemeData(
          backgroundColor: Colors.white,
          primaryColor: ScribiumColors.darkPurple,
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              color: ScribiumColors.darkPurple,
              fontFamily: "Yeseva",
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
        },
      ),
    );
  }
}
