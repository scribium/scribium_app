import 'dart:ui';

import 'package:scribium_app/components/short_item_list.dart';
import 'package:scribium_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class TimeTableGrid extends StatelessWidget {
  const TimeTableGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 5 / 7,
      child: Container(
        margin: const EdgeInsets.only(right: 5, left: 15, top: 15),
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
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  width: double.infinity,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Timetable",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w100,
                            fontFamily: "Archivo",
                          ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: ShortItemList(
                        index: 2,
                        items: ["HIS", "PT", "ENG", "AW", "SA"],
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
