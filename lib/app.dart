import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/auth.dart';
import 'screens/intro_screen.dart';
import 'utilities/constants.dart';
import 'screens/login_screen.dart';
import 'screens/main_panel_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: Add multiprovider, with one changenotifier storing settings.

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Auth(),
        ),
      ],
      child: MaterialApp(
        title: "Scribium App",
        // Themes set
        // TODO: Add different themes
        theme: ScribiumThemes.light,

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
          MainPanelScreen.routeName: (context) => const MainPanelScreen(),
        },
      ),
    );
  }
}