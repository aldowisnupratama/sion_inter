import 'package:flutter/material.dart';

import 'package:sion_inter/model/model.dart';
import 'package:sion_inter/shared/shared.dart';
import 'package:sion_inter/ui/ui.dart';

class FinalTestPage extends StatelessWidget {
  final List<Uas>? listOfUas;
  const FinalTestPage({Key? key, required this.listOfUas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(color: kBackgroundColor),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: SizeConfig.blockVertical(2)),
              width: SizeConfig.blockHorizontal(80),
              height: SizeConfig.blockVertical(20),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/scheduling.png"))),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(
                  top: SizeConfig.blockVertical(4),
                  right: SizeConfig.blockHorizontal(5),
                  left: SizeConfig.blockHorizontal(5),
                ),
                child: Text(
                  "Final Test Schedule",
                  style: blackTextStyle.copyWith(
                      fontSize: 20, fontWeight: semiBold),
                ),
              ),
            ),
            Column(
              children:
                  listOfUas!.map((e) => CostumeFinalTestCard(uas: e)).toList(),
            )
          ],
        ),
      ),
    );
  }
}
