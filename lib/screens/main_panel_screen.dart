import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scribium_app/components/main/app_bar.dart';
import 'package:scribium_app/constants.dart';

import '../components/empty_box.dart';
import '../components/main/assignments_list.dart';
import '../components/main/main_grid_panel.dart';

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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          (mQD.size.height - mQD.padding.vertical) * 0.25,
        ),
        child: MainAppBar(
          getScrollController: getScrollController,
          mQD: mQD,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "Grades",
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            EmptyBox(
              mQD: mQD,
              height: 0.275,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: (mQD.size.height - mQD.padding.vertical) * 0.04,
              child: Text(
                "Last emails",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 25,
                    ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: (mQD.size.height - mQD.padding.vertical) * 0.15,
              child: const AssignmentsList(),
            ),
            SizedBox(
              height: (mQD.size.height - mQD.padding.vertical) * 1,
              child: MainGridPanel(
                mQD: mQD,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
