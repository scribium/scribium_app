import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scribium_app/utilities/constants.dart';

class WarningsGrid extends StatelessWidget {
  const WarningsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        margin: const EdgeInsets.only(right: 15, left: 5, top: 15),
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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {},
              child: ClipRect(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    FittedBox(
                      fit: BoxFit.cover,
                      child: Icon(
                        Icons.warning_amber_rounded,
                        color: ScribiumColors.lightPurple.withOpacity(0.5),
                      ),
                    ),

                    //TODO: finish
                    FittedBox(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Warnings",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w100,
                                      fontFamily: "Archivo",
                                    ),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                "0",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: ScribiumColors.darkPurple,
                                      fontWeight: FontWeight.w100,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // ClipRect(
                    //   child: Material(
                    //     color: Colors.transparent,
                    //     child: InkWell(
                    //       onTap: () {},
                    //       borderRadius: BorderRadius.circular(15),
                    //       child: Column(
                    //         children: [
                    //           Container(
                    //             margin: const EdgeInsets.all(5),
                    //             width: double.infinity,
                    //             child: FittedBox(
                    //               fit: BoxFit.scaleDown,
                    //               alignment: Alignment.centerLeft,
                    //               child: Text(
                    //                 "Warnings",
                    //                 style: Theme.of(context)
                    //                     .textTheme
                    //                     .titleMedium!
                    //                     .copyWith(
                    //                       fontSize: 20,
                    //                       fontWeight: FontWeight.w100,
                    //                       fontFamily: "Archivo",
                    //                     ),
                    //                 textAlign: TextAlign.left,
                    //               ),
                    //             ),
                    //           ),
                    //           Expanded(
                    //             child: Padding(
                    //               padding: const EdgeInsets.all(5),
                    //               child: ClipRRect(
                    //                 borderRadius: BorderRadius.circular(15),
                    //                 child: FittedBox(
                    //                   fit: BoxFit.fitHeight,
                    //                   child: Stack(
                    //                     alignment: Alignment.center,
                    //                     children: [
                    //                       //TODO: Fix not working blur
                    //                       const Icon(
                    //                         Icons.warning_amber_rounded,
                    //                         color: ScribiumColors.lightPurple,
                    //                       ),
                    //                       BackdropFilter(
                    //                         filter: ImageFilter.blur(
                    //                             sigmaX: 1.5, sigmaY: 1.5),
                    //                         child: Text(
                    //                           "0",
                    //                           style: Theme.of(context)
                    //                               .textTheme
                    //                               .titleSmall!
                    //                               .copyWith(
                    //                                 color: ScribiumColors.darkPurple,
                    //                                 fontWeight: FontWeight.w100,
                    //                               ),
                    //                           textAlign: TextAlign.center,
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                   // child: Text(
                    //                   //   "0",
                    //                   //   style: TextStyle(
                    //                   //     fontWeight: FontWeight.w200,
                    //                   //   ),
                    //                   // ),
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
