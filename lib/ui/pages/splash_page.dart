import 'dart:async';

import 'package:flutter/material.dart';
import '../../shared/shared.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, loginScreenPath);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
          child: Container(
        width: SizeConfig.blockHorizontal(60),
        height: SizeConfig.blockVertical(70),
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage("assets/images/stikom.png"))),
      )),
    );
  }
}
