import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:scribium_app/components/main/calendar_grid.dart';
import 'package:scribium_app/extensions/number_extension.dart';
import 'package:scribium_app/utilities/constants.dart';

import 'grades_grid.dart';

class MainGridPanel extends StatelessWidget {
  final MediaQueryData mQD;
  const MainGridPanel({required this.mQD, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        children: [
          ...[
            const GradesGrid(),
            const CalendarGrid(),
            for (int i = 0; i < 5; i++)
              AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  //TODO: Default 15
                  margin: (i / 2).isInteger
                      ? const EdgeInsets.only(right: 15, left: 5, top: 10) // RIGHT
                      : const EdgeInsets.only(right: 5, left: 15, top: 10), //LEFT
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).shadowColor,
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(15),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.grade),
                            Text(
                              "SOON",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: ScribiumColors.darkPurple,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ]
        ],
      ),
    );
  }
}
