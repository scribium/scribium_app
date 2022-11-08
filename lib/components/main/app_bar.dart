import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scribium_app/extensions/string_extension.dart';
import 'package:scribium_app/providers/auth.dart';

import '../../utilities/constants.dart';

class MainAppBar extends StatefulWidget {
  final MediaQueryData mQD;
  final Function getScrollController;
  const MainAppBar(
      {required this.mQD, required this.getScrollController, super.key});

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  //TODO: Add MainAppBarStatus in case of more appbar states.
  bool showAppBar = true;

  @override
  void initState() {
    super.initState();

    final ScrollController _controller = widget.getScrollController();

    _controller.addListener(() {
      bool isTop = _controller.position.pixels <= 50.0;
      if (showAppBar == isTop) return;

      setState(() {
        showAppBar = isTop;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    scrollToTheTop() {
      widget.getScrollController().animateTo(
            0.0,
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOutQuart,
          );
    }

    return GestureDetector(
      onTap: () {
        scrollToTheTop();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeOutQuart,
        height: showAppBar ? 150 : 80,
        width: (widget.mQD.size.height - widget.mQD.padding.vertical) * 1,
        decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              blurRadius: 15,
              spreadRadius: 5,
            ),
          ],
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(
              50,
            ),
            bottomRight: Radius.circular(
              50,
            ),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(
                  50,
                ),
                bottomRight: Radius.circular(
                  50,
                ),
              ),
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 50,
                    sigmaY: 50,
                  ),
                  child: Container(
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          padding: const EdgeInsets.only(left: 30),
                          curve: Curves.easeOutQuart,
                          alignment: Alignment.center,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              onTap: () {},
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 1000),
                                switchInCurve: Curves.easeOutQuart,
                                switchOutCurve: Curves.easeOutQuart,
                                transitionBuilder: (child, animation) {
                                  return RotationTransition(
                                    turns: animation,
                                    child: ScaleTransition(
                                      scale: animation,
                                      child: child,
                                    ),
                                  );
                                },
                                child: showAppBar
                                    ? Icon(
                                        Icons.account_circle_rounded,
                                        key: UniqueKey(),
                                      )
                                    : GestureDetector(
                                        child: Icon(
                                          Icons.expand_more_rounded,
                                          key: UniqueKey(),
                                        ),
                                        onTap: () {
                                          scrollToTheTop();
                                        },
                                      ),
                                // child: Icon(
                                //   showAppBar
                                //       ? Icons.account_circle_rounded
                                //       : Icons.expand_circle_down,
                                //),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          customBorder: const CircleBorder(),
                          onTap: () {},
                          child: const Icon(
                            Icons.notifications,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedOpacity(
                  opacity: showAppBar ? 1 : 0,
                  curve: Curves.easeOutQuart,
                  duration: const Duration(milliseconds: 250),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: AnimatedDefaultTextStyle(
                          textAlign: TextAlign.center,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeOutQuart,
                          style: showAppBar
                              ? Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 40,
                                    color: ScribiumColors.darkPurple,
                                  )
                              : Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 1,
                                    color: ScribiumColors.darkPurple,
                                  ),
                          child: Consumer<Auth>(
                            //TODO: Fix height > 0.0': is not true. error
                            builder: (context, value, child) => FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Hello, ${value.user!.details.name}!",
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        child: AnimatedDefaultTextStyle(
                          textAlign: TextAlign.center,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeOutQuart,
                          style: showAppBar
                              ? Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 20,
                                    color: ScribiumColors.darkPurple,
                                  )
                              : Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 1,
                                    color: ScribiumColors.darkPurple,
                                  ),
                          child:
                              Consumer<Auth>(builder: (context, value, child) {
                            return FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "${value.user!.role[0].name}'s account"
                                    .toCapitalized(),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
