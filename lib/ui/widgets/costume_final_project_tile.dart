import 'package:flutter/material.dart';
import 'package:sion_inter/model/model.dart';

import '../../shared/shared.dart';

class CostumeFPTile extends StatelessWidget {
  final FinalProjectTopic finalProjectTopic;
  const CostumeFPTile({Key? key, required this.finalProjectTopic})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: SizeConfig.blockHorizontal(5),
          right: SizeConfig.blockHorizontal(5),
          top: SizeConfig.blockVertical(3),
          bottom: SizeConfig.blockVertical(3)),
      margin: EdgeInsets.only(top: SizeConfig.blockVertical(2)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(width: 2, color: kPrimaryColor)),
      child: ListTile(
        leading: Icon(
          Icons.topic,
          size: 50,
          color: kPrimaryColor,
        ),
        title: Text(
          "${finalProjectTopic.judul}",
          style: blackTextStyle.copyWith(fontSize: 13),
        ),
        subtitle: Text(
          "${finalProjectTopic.namaDosen}",
          style: blackTextStyle.copyWith(fontSize: 13),
        ),
      ),
    );
  }
}
