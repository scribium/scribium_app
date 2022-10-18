import 'package:flutter/material.dart';

class LoginInputs extends StatefulWidget {
  final MediaQueryData mQD;
  final Size size;
  const LoginInputs({required this.mQD, required this.size, super.key});

  @override
  State<LoginInputs> createState() => _LoginInputsState();
}

class _LoginInputsState extends State<LoginInputs> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height,
      width: widget.size.width,
      child: Column(
        children: [
          SizedBox(
            height:
                (widget.mQD.size.height - widget.mQD.padding.vertical) * 0.05,
            width:
                (widget.mQD.size.width - widget.mQD.padding.horizontal) * 0.8,
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
            height:
                (widget.mQD.size.height - widget.mQD.padding.vertical) * 0.05,
          ),
          SizedBox(
            width:
                (widget.mQD.size.width - widget.mQD.padding.horizontal) * 0.7,
            height:
                (widget.mQD.size.height - widget.mQD.padding.vertical) * 0.075,
            child: const TextField(
              textAlign: TextAlign.start,
              textInputAction: TextInputAction.done,
              scrollPhysics: BouncingScrollPhysics(),
              scrollPadding: EdgeInsets.zero,
              decoration: InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(Icons.account_circle_rounded),
              ),
            ),
          ),
          SizedBox(
            width:
                (widget.mQD.size.width - widget.mQD.padding.horizontal) * 0.7,
            height:
                (widget.mQD.size.height - widget.mQD.padding.vertical) * 0.075,
            child: TextField(
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
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
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
        ],
      ),
    );
  }
}
