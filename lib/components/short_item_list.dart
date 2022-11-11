import 'dart:ui';

import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class ShortItemList extends StatelessWidget {
  final int index;
  final List<String> items;

  const ShortItemList({
    required this.index,
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Map map = items.asMap();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
          child: Text(
            map[index - 2] ?? " ",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ScribiumColors.darkPurple,
                  fontSize: 13,
                ),
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          map[index - 1] ?? " ",
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: ScribiumColors.lightPurple,
                fontSize: 19,
              ),
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 11,
            ),
            Text(
              map[index] ?? " ",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: ScribiumColors.darkPurple,
                    fontSize: 23,
                  ),
              textAlign: TextAlign.center,
            ),
            const Icon(
              Icons.arrow_back_ios_rounded,
              size: 11,
            ),
          ],
        ),
        Text(
          map[index + 1] ?? " ",
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: ScribiumColors.lightPurple,
                fontSize: 19,
              ),
          textAlign: TextAlign.center,
        ),
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
          child: Text(
            map[index + 2] ?? " ",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ScribiumColors.darkPurple,
                  fontSize: 13,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
