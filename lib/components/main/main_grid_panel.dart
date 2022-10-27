import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:scribium_app/constants.dart';

class MainGridPanel extends StatelessWidget {
  final MediaQueryData mQD;
  const MainGridPanel({required this.mQD, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        children: [
          for (int i = 0; i < 4; i++)
            Container(
              height: (mQD.size.height - mQD.padding.vertical) * 0.2,
              margin: const EdgeInsets.all(15),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.grade),
                      Text(
                        "SOON",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: ScribiumColors.darkPurple,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
