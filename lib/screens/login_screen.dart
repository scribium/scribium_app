import 'package:flutter/material.dart';
import 'package:scribium_app/components/login/login_inputs.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/login";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mQD = MediaQuery.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: (_mQD.size.height - _mQD.padding.vertical) * 0.05,
              ),

              // height: 0.25
              Image.asset(
                "assets/images/scribium-logo-icon.png",
                height: (_mQD.size.height - _mQD.padding.vertical) * 0.2,
                width: (_mQD.size.width - _mQD.padding.horizontal) * 1,
              ),

              // height: 0.05 (0.30)
              SizedBox(
                height: (_mQD.size.height - _mQD.padding.vertical) * 0.05,
              ),

              // height: 0.25 (0.55)
              LoginInputs(
                mQD: _mQD,
                size: Size(
                  double.infinity,
                  (_mQD.size.height - _mQD.padding.vertical) * 0.4,
                ),
              ), //TODO: Set height and width using property
              const Spacer(),

              // height: 0.05 (0.70)
              SizedBox(
                height: (_mQD.size.height - _mQD.padding.vertical) * 0.05,
                child: Text(
                  "© 2022 Scribium Gradebook - All rights reserved",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
