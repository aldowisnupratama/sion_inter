import 'dart:async';

import 'package:flutter/material.dart';

import 'package:sion_inter/model/model.dart';

import 'package:sion_inter/shared/shared.dart';
import 'package:sion_inter/ui/ui.dart';

class FinalProjectsPage extends StatelessWidget {
  final List<FinalProjectTopic> finalProjectTopic;
  FinalProjectsPage({
    Key? key,
    required this.finalProjectTopic,
  }) : super(key: key);
  bool greaterThanZero = false;

  @override
  Widget build(BuildContext context) {
    if (finalProjectTopic.length > 0) {
      return Scaffold(
          body: Container(
        margin: EdgeInsets.only(
            left: SizeConfig.blockHorizontal(6),
            right: SizeConfig.blockHorizontal(6)),
        child: Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(top: SizeConfig.blockVertical(2)),
              child: Text(
                "Final Project Topic",
                style:
                    blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
              ),
            ),
          ),
          Container(
            width: SizeConfig.blockHorizontal(80),
            height: SizeConfig.blockVertical(32),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/stikom_home.png"))),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text(
                "Your Project's Topic",
                style:
                    blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
              ),
            ),
          ),
          Column(
            children: (finalProjectTopic
                .map((e) => CostumeFPTile(finalProjectTopic: e))
                .toList()),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.only(top: SizeConfig.blockVertical(1)),
              child: TextButton(
                child: Text(
                  "Need more referense >>>",
                  style: lightBlueTextStyle,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, searchFinalProjectScreenPath);
                },
              ),
            ),
          )
        ]),
      ));
    }
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(
          left: SizeConfig.blockHorizontal(6),
          right: SizeConfig.blockHorizontal(6)),
      child: Column(children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.only(top: SizeConfig.blockVertical(2)),
            child: Text(
              "Final Project Topic",
              style:
                  blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
            ),
          ),
        ),
        Container(
          width: SizeConfig.blockHorizontal(80),
          height: SizeConfig.blockVertical(32),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/stikom_home.png"))),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            child: Text(
              "Your Project's Topic",
              style:
                  blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
            ),
          ),
        ),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(width: 2, color: kPrimaryColor)),
              margin: EdgeInsets.only(
                top: SizeConfig.blockVertical(1),
              ),
              padding: EdgeInsets.only(
                  left: SizeConfig.blockHorizontal(2),
                  right: SizeConfig.blockHorizontal(2),
                  top: SizeConfig.blockVertical(5),
                  bottom: SizeConfig.blockVertical(5)),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "You haven't submitted the final project topic",
                    style: darkBlueTextStyle.copyWith(
                        fontSize: 13, fontWeight: semiBold),
                  )),
            )
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: EdgeInsets.only(top: SizeConfig.blockVertical(1)),
            child: TextButton(
              child: Text(
                "Need more referense >>>",
                style: lightBlueTextStyle,
              ),
              onPressed: () {
                Navigator.pushNamed(context, searchFinalProjectScreenPath);
              },
            ),
          ),
        )
      ]),
    ));
    ;
  }
}
