import 'package:flutter/material.dart';
import 'package:sion_inter/model/model.dart';
import 'package:sion_inter/shared/shared.dart';

class GPATile extends StatelessWidget {
  final GPA gpa;
  const GPATile({Key? key, required this.gpa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: SizeConfig.blockVertical(1),
          left: SizeConfig.blockHorizontal(4),
          right: SizeConfig.blockHorizontal(4)),
      padding: EdgeInsets.only(
          top: SizeConfig.blockVertical(2),
          left: SizeConfig.blockHorizontal(6),
          right: SizeConfig.blockHorizontal(6),
          bottom: SizeConfig.blockVertical(2)),
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: kPrimaryColor),
          borderRadius: BorderRadius.circular(defaultRadius),
          color: kWhiteColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "${gpa.ipSemester}",
                style: greenTextStyle.copyWith(fontSize: 54, fontWeight: bold),
              ),
              Row(
                children: [
                  Text(
                    "Credits:",
                    style: blackTextStyle.copyWith(
                        fontSize: 12, fontWeight: semiBold),
                  ),
                  Text(
                    "   ${gpa.sksSemester}",
                    style: blackTextStyle.copyWith(
                        fontSize: 12, fontWeight: semiBold),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Total Credit:\t${gpa.sksKumulatif}",
                    style: blackTextStyle.copyWith(
                        fontSize: 12, fontWeight: semiBold),
                  ),
                ],
              )
            ],
          ),
          Column(
            children: [
              Text(
                "Semester",
                style:
                    blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
              ),
              Text(
                "${gpa.semester}",
                style: yellowTextStyle.copyWith(
                    fontSize: 18, fontWeight: semiBold),
              ),
              Text(
                "GPA Comulative",
                style:
                    blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
              ),
              Text(
                "${gpa.ipKumulatif}",
                style: yellowTextStyle.copyWith(
                    fontSize: 18, fontWeight: semiBold),
              )
            ],
          )
        ],
      ),
    );
  }
}
