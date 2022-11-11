import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:scribium_app/components/main/calendar_grid.dart';
import 'package:scribium_app/components/main/frequency_grid.dart';
import 'package:scribium_app/components/main/timetable_grid.dart';
import 'package:scribium_app/components/main/warnings_grid.dart';

import 'grades_grid.dart';

class MainGridPanel extends StatelessWidget {
  final MediaQueryData mQD;
  const MainGridPanel({required this.mQD, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      child: StaggeredGrid.count(
        crossAxisCount: 2,

        /*

        margin: (i / 2).isInteger
    ? const EdgeInsets.only(
        right: 15, left: 5, top: 10) // RIGHT
    : const EdgeInsets.only(
        right: 5, left: 15, top: 10), //LEFT

        */
        children: const [
          ...[
            GradesGrid(),
            CalendarGrid(),
            WarningsGrid(),
            TimeTableGrid(),
            FrequencyGrid(),
          ]
        ],
      ),
    );
  }
}
