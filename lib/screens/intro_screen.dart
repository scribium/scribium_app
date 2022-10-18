import 'package:flutter/material.dart';

import 'login_screen.dart';

class IntroScreen extends StatefulWidget {
  static const routeName = "/";

  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 1500), () {
      Navigator.of(context).push(_createRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Center(
          child: Image.asset("assets/images/scribium-logo.png"),
        ),
      ),
    );
  }

  Route _createRoute() {
    // TODO: Check if user has already an account
    // TODO: Skip login if the user is logged
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 1500),
      pageBuilder: (context, animation, secondaryAnimation) =>
          const LoginScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        const curve = Curves.easeOutQuart;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return FadeTransition(
          opacity: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
