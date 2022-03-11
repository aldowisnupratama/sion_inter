import 'package:flutter/material.dart';

import '../../shared/shared.dart';

class NullScheduleCard extends StatelessWidget {
  const NullScheduleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(width: 2, color: kPrimaryColor)),
      margin: EdgeInsets.only(
          top: SizeConfig.blockVertical(1),
          left: SizeConfig.blockHorizontal(5),
          right: SizeConfig.blockHorizontal(5)),
      padding: EdgeInsets.only(
          left: SizeConfig.blockHorizontal(2),
          right: SizeConfig.blockHorizontal(2),
          top: SizeConfig.blockVertical(5),
          bottom: SizeConfig.blockVertical(5)),
      child: Align(
          alignment: Alignment.center,
          child: Text(
            "You don't have a class schedule on this day",
            style:
                darkBlueTextStyle.copyWith(fontSize: 13, fontWeight: semiBold),
          )),
    );
  }
}
