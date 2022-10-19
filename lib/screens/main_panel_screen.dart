import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scribium_app/constants.dart';

class MainPanelScreen extends StatelessWidget {
  const MainPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mQD = MediaQuery.of(context);

    SystemChrome.setSystemUIOverlayStyle(
      ScribiumSystemUiOverlayStyle.light,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: ScribiumColors.darkPurple,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "Grades",
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: (mQD.size.height - mQD.padding.vertical) * 0.25,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 15,
                  spreadRadius: 5,
                ),
              ],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(
                  50,
                ),
                bottomRight: Radius.circular(50),
              ),
              color: ScribiumColors.lightPurple,
              gradient: const LinearGradient(
                colors: [
                  ScribiumColors.lightPurple,
                  Color.fromARGB(255, 170, 157, 186),
                  Color.fromARGB(255, 159, 136, 188),
                ],
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(
                      50,
                    ),
                    bottomRight: Radius.circular(50),
                  ),
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 50,
                        sigmaY: 50,
                      ),
                      child: Container(
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Hi, Łukasz!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 40,
                        color: ScribiumColors.darkPurple,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
