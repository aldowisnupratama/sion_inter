import 'package:flutter/material.dart';
import 'package:sion_inter/model/schedule_model.dart';

import '../../shared/shared.dart';

class ScheduleCard extends StatelessWidget {
  final List<JadwalKuliah> listOfJadwalKuliah;
  ScheduleCard({Key? key, required this.listOfJadwalKuliah}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: listOfJadwalKuliah
              .map((e) => Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(width: 1, color: kPrimaryColor)),
                    padding: EdgeInsets.only(
                        left: SizeConfig.blockHorizontal(2),
                        right: SizeConfig.blockHorizontal(2),
                        top: SizeConfig.blockVertical(1),
                        bottom: SizeConfig.blockVertical(1)),
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockVertical(1),
                        left: SizeConfig.blockHorizontal(5),
                        right: SizeConfig.blockHorizontal(5)),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              right: SizeConfig.blockHorizontal(4)),
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: kPrimaryColor),
                            shape: BoxShape.circle,
                          ),
                          width: SizeConfig.blockHorizontal(18),
                          height: SizeConfig.blockVertical(10),
                          child: Center(child: Text("${e.jam.split('-')[0]}")),
                        ),
                        Expanded(
                            child: Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(e.kodeMatkul),
                                Text(
                                  e.namaMatkul,
                                  style: lightBlueTextStyle.copyWith(
                                      fontWeight: semiBold),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_rounded,
                                        color: kPrimaryColor,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(e.namaKelas)
                                    ],
                                  ),
                                ),
                                Text(e.namaDosen)
                              ]),
                        ))
                      ],
                    ),
                  ))
              .toList()),
    );
  }
}
