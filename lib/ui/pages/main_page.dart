import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:sion_inter/shared/shared.dart';

import 'package:sion_inter/ui/ui.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
          controller: drawerController,
          // backgroundColor: Colors.grey[400]!,
          backgroundColor: kYellowColor,
          style: DrawerStyle.Style1,
          borderRadius: 24.0,
          showShadow: true,
          angle: 0.0,
          slideWidth: MediaQuery.of(context).size.width * .65,
          openCurve: Curves.fastOutSlowIn,
          closeCurve: Curves.easeInOut,
          menuScreen: DrawerMenu(
            drawerController: drawerController,
          ),
          mainScreen: HomePage(
            drawerController: drawerController,
          )),
    );
  }
}
