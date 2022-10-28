import 'package:flutter/material.dart';
import 'package:scribium_app/components/card.dart' as s;
import 'package:scribium_app/constants.dart';

class AssignmentsList extends StatelessWidget {
  const AssignmentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return s.Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              for (int i = 0; i < 4; i++)
                Container(
                  width: 75,
                  height: 75,
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    //color: ScribiumColors.darkPurple,
                    shape: BoxShape.circle,
                    border: Border.all(color: ScribiumColors.darkPurple),
                  ),
                  child: const Icon(Icons.markunread_sharp),
                ),
            ],
          ),
        ),
      ),
    );
  }
}