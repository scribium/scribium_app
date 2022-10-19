import 'package:flutter/material.dart';
import 'package:scribium_app/components/login/login_inputs.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/login";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mQD = MediaQuery.of(context);
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              //HACK: I put the bottom message on top in the stack, so the transition between screens will cover the text.

              SizedBox(
                height: (mQD.size.height - mQD.padding.vertical) * 0.05,
                child: Text(
                  "© 2022 Scribium Gradebook - All rights reserved",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: (mQD.size.height - mQD.padding.vertical) * 0.05,
                  ),

                  // height: 0.25
                  Image.asset(
                    "assets/images/scribium-logo-icon.png",
                    height: (mQD.size.height - mQD.padding.vertical) * 0.2,
                    width: (mQD.size.width - mQD.padding.horizontal) * 1,
                  ),

                  // height: 0.05 (0.30)
                  SizedBox(
                    height: (mQD.size.height - mQD.padding.vertical) * 0.05,
                  ),

                  // height: 0.25 (0.55)
                  LoginInputs(
                    mQD: mQD,
                    size: Size(
                      double.infinity,
                      (mQD.size.height - mQD.padding.vertical) * 0.4,
                    ),
                  ), //TODO: Set height and width using property
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
