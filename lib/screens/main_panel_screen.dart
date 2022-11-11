import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scribium_app/components/main/app_bar.dart';
import 'package:scribium_app/utilities/constants.dart';

import '../components/main/assignments_list.dart';
import '../components/main/main_grid_panel.dart';

import '../components/card.dart' as c;

class MainPanelScreen extends StatefulWidget {
  static const routeName = "/main";
  const MainPanelScreen({super.key});

  @override
  State<MainPanelScreen> createState() => _MainPanelScreenState();
}

class _MainPanelScreenState extends State<MainPanelScreen> {
  final ScrollController _scrollController = ScrollController();

  ScrollController getScrollController() {
    return _scrollController;
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mQD = MediaQuery.of(context);

    SystemChrome.setSystemUIOverlayStyle(
      ScribiumSystemUiOverlayStyle.light,
    );

    // TODO: Check if the app is opened on mobile or (laptop / tablet)

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: mQD.size.width <= Constants.largeBreakPoint
          ? PreferredSize(
              preferredSize: const Size.fromHeight(
                300,
              ),
              child: MainAppBar(
                getScrollController: getScrollController,
                mQD: mQD,
              ),
            )
          : null,
      bottomNavigationBar: mQD.size.width <= Constants.largeBreakPoint
          ? BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: "Dashboard",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.assignment),
                  label: "Grades",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: "Settings",
                ),
              ],
            )
          : null,
      body:

          // PHONE

          mQD.size.width <= Constants.largeBreakPoint
              ? ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false),
                  child: SingleChildScrollView(
                      controller: _scrollController,
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: kToolbarHeight + 120,
                          ),
                          // EmptyBox(
                          //   mQD: mQD,
                          //   height: 0.275,
                          // ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            width: double.infinity,
                            child: Text(
                              "Assignments",
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
                          ),
                          const SizedBox(
                            height: 100,
                            child: AssignmentsList(),
                          ),
                          MainGridPanel(
                            mQD: mQD,
                          ),
                        ],
                      )),
                )

              // TABLET / COMPUTER

              : SizedBox(
                  width: (mQD.size.width - mQD.padding.horizontal) * 1,
                  child: Row(
                    children: [
                      c.Card(
                        child: NavigationRail(
                          selectedIndex: 0,
                          groupAlignment: -1.0,
                          labelType: NavigationRailLabelType.selected,
                          leading: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.account_box_rounded,
                                  size: 40,
                                ),
                                Text("Łukasz"),
                              ],
                            ),
                          ),
                          destinations: const <NavigationRailDestination>[
                            NavigationRailDestination(
                              icon: Icon(Icons.dashboard),
                              selectedIcon: Icon(Icons.dashboard),
                              label: Text('DashBoard'),
                            ),
                            NavigationRailDestination(
                              icon: Icon(Icons.assignment),
                              selectedIcon: Icon(Icons.assignment),
                              label: Text('Grades'),
                            ),
                            NavigationRailDestination(
                              icon: Icon(Icons.settings),
                              selectedIcon: Icon(Icons.settings),
                              label: Text('Settings'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}