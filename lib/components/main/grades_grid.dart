import 'package:flutter/material.dart';
import 'package:scribium_app/clipper/curved_clipper.dart';
import 'package:scribium_app/components/curved_chart.dart';

import '../../utilities/constants.dart';

class GradesGrid extends StatelessWidget {
  const GradesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final xValues = [
      0.0,
      1.0,
      0.0,
      2.0,
      3.0,
      1.0,
      1.5,
    ];

    final yValues = [
      0.0,
      1.0,
      2.0,
      3.0,
      4.0,
    ];

    const stroke = 3.0;

    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        margin: const EdgeInsets.only(right: 5, left: 15, top: 15), //LEFT
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
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  width: double.infinity,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Grades: 3.50",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w100,
                            fontFamily: "Archivo",
                          ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CustomPaint(
                      child: ClipPath(
                        clipper: CurvedClipper(
                          xValues: xValues,
                          yValues: yValues,
                          strokeWidth: stroke,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                ScribiumColors.darkPurple.withOpacity(0.45),
                                Colors.white.withOpacity(0.0),
                              ],
                            ),
                          ),
                          width: 200,
                          height: 150,
                          child: CustomPaint(
                            painter: CurvedChart(
                              xValues: xValues,
                              yValues: yValues,
                              strokeWidth: stroke,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
