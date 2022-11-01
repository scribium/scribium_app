import 'package:flutter/material.dart';

class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({required super.builder});

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    //return super.buildTransitions(context, animation, secondaryAnimation, child);

    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}

class CustomTransition<T> extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    //return super.buildTransitions(context, animation, secondaryAnimation, child);

    // animation = CurvedAnimation(parent: animation, curve: Curves.easeOutQuart);

    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
