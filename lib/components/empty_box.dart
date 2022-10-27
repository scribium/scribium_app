import 'package:flutter/cupertino.dart';

class EmptyBox extends StatelessWidget {
  final MediaQueryData mQD;
  final double height;

  const EmptyBox({required this.mQD, this.height = 1.0, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (mQD.size.height - mQD.padding.vertical) * height,
    );
  }
}
