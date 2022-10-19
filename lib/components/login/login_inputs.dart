import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:scribium_app/constants.dart';
import 'package:scribium_app/providers/auth.dart';
import 'package:scribium_app/screens/main_panel_screen.dart';

class LoginInputs extends StatefulWidget {
  final MediaQueryData mQD;
  final Size size;

  const LoginInputs({required this.mQD, required this.size, super.key});

  @override
  State<LoginInputs> createState() => _LoginInputsState();
}

class _LoginInputsState extends State<LoginInputs> {
  
  // Controller storing information from the mail and password inputs.
  late TextEditingController _mailInput;
  late TextEditingController _passwordInput;

  @override
  void initState() {
    super.initState();

    _mailInput = TextEditingController();
    _passwordInput = TextEditingController();
  }

  // Dim is used in the background to hide all elements, when the user is sending the request to login.
  bool _dimmed = false;

  // This changes the visibility of the password input
  bool _passwordVisible = false;

  // Begin and End, both are used to manage the blur animation
  double _begin = 5.0;
  double _end = 0.0;

  // String displayed below the login button, in case of an error from the server or the user.
  String _errorMessage = "";

  // Property used for now, as I don't have a possibility to check if user can, or can't be logged in.
  // TODO: Delete in a future.
  bool _logged = false;

  set logged(bool value) {
    setState(() {
      _logged = true;
    });
  }

  set errorMessage(String value) {
    setState(() {
      _errorMessage = value;
    });
  }

  set dimmed(bool value) {
    setState(() {
      _dimmed = value;
      _begin == 5.0 ? _begin = 0.0 : _begin = 5.0;
      _end == 0.0 ? _end = 5.0 : _end = 0.0;
    });
  }

  @override
  void dispose() {
    super.dispose();

    _mailInput.dispose();
    _passwordInput.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Auth provider = context.read<Auth>();

    if (_logged) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        SystemChrome.setSystemUIOverlayStyle(
          ScribiumSystemUiOverlayStyle.light.copyWith(

            // At the end of animation change the system navigation color, so the background matches it.
            systemNavigationBarColor: ScribiumColors.darkPurple,
            systemNavigationBarIconBrightness: Brightness.light,
          ),
        );
      });
    }

    return SizedBox(
      height: widget.size.height,
      width: widget.size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                height: (widget.mQD.size.height - widget.mQD.padding.vertical) *
                    0.05,
                width: (widget.mQD.size.width - widget.mQD.padding.horizontal) *
                    0.8,
                child: FittedBox(
                  child: Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 40,
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: (widget.mQD.size.height - widget.mQD.padding.vertical) *
                    0.05,
              ),
              SizedBox(
                width: (widget.mQD.size.width - widget.mQD.padding.horizontal) *
                    0.7,
                height: (widget.mQD.size.height - widget.mQD.padding.vertical) *
                    0.075,
                child: TextField(
                  controller: _mailInput,
                  textAlign: TextAlign.start,
                  textInputAction: TextInputAction.done,
                  scrollPhysics: const BouncingScrollPhysics(),
                  scrollPadding: EdgeInsets.zero,
                  decoration: const InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.account_circle_rounded),
                  ),
                ),
              ),
              SizedBox(
                width: (widget.mQD.size.width - widget.mQD.padding.horizontal) *
                    0.7,
                height: (widget.mQD.size.height - widget.mQD.padding.vertical) *
                    0.075,
                child: TextField(
                  controller: _passwordInput,
                  textAlign: TextAlign.start,
                  textInputAction: TextInputAction.done,
                  scrollPhysics: const BouncingScrollPhysics(),
                  obscureText: !_passwordVisible,
                  scrollPadding: EdgeInsets.zero,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.password_rounded),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),

              // height: 0.05 (0.60)
              SizedBox(
                height: (widget.mQD.size.height - widget.mQD.padding.vertical) *
                    0.05,
              ),

              // height: 0.05 (0.65)
              SizedBox(
                height: (widget.mQD.size.height - widget.mQD.padding.vertical) *
                    0.05,
                width: (widget.mQD.size.width - widget.mQD.padding.horizontal) *
                    0.7,
                child: OutlinedButton(
                  onPressed: () async {
                    if (_dimmed) {
                      return;
                    }

                    if (provider.isLogged()) {
                      //TODO: Move to the main screen
                      return;
                    }

                    // Data checker...
                    if (_mailInput.text.isEmpty ||
                        _passwordInput.text.isEmpty) {
                      errorMessage = "Email and password cannot be empty.";
                      return;
                    }
                    if (!_mailInput.text.contains("@")) {
                      errorMessage = "The provided email doesn't exists.";
                      return;
                    }

                    errorMessage = "";
                    dimmed = true;

                    await provider.loginUser("Email", "Password").then(
                          (value) => setState(
                            () {
                              logged = true;
                            },
                          ),
                        );
                  },
                  child: const Text(
                    "Login",
                  ),
                ),
              ),
              SizedBox(
                height: (widget.mQD.size.height - widget.mQD.padding.vertical) *
                    0.05,
                width: (widget.mQD.size.width - widget.mQD.padding.horizontal) *
                    0.7,
                child: Center(
                  child: Text(
                    _errorMessage,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.red,
                        ),
                  ),
                ),
              ),
            ],
          ),
          IgnorePointer(
            ignoring: (!_dimmed && _begin == 5.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRect(
                    child: TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: _begin, end: _end),
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                      builder: (_, value, __) {
                        return BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: value,
                            sigmaY: value,
                          ),
                          child: Container(
                            color: Colors.transparent,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOutQuart,
                  opacity: _dimmed ? 1 : 0,
                  child: Center(
                    child: AnimatedScale(
                      duration: const Duration(
                        milliseconds: 2000,
                      ),
                      onEnd: () {
                        Navigator.of(context).push(_createRoute());
                      },
                      curve: Curves.easeInOutBack,
                      
                      //TODO: detect the device scale to fill screen
                      scale: _logged ? 25 : 1,
                      child: AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 250,
                        ),
                        curve: Curves.easeOutQuart,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _logged
                              ? ScribiumColors.darkPurple
                              : Colors.transparent,
                        ),
                        child: const CircularProgressIndicator(
                          strokeWidth: 1.5,
                          color: ScribiumColors.darkPurple,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Route _createRoute() {
    // TODO: Check if user has already an account
    // TODO: Skip login if the user is logged
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 1500),
      pageBuilder: (context, animation, secondaryAnimation) =>
          const MainPanelScreen(),
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
