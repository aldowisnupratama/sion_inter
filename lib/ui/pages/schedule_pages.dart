import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sion_inter/cubit/attendance/attendancecubit_cubit.dart';

import 'package:sion_inter/model/schedule_model.dart';
import '../../cubit/cubit.dart';

import 'package:sion_inter/shared/shared.dart';
import 'package:sion_inter/ui/ui.dart';

class SchedulePage extends StatelessWidget {
  final List<JadwalKuliah> listofJadwalKuliah;
  SchedulePage({Key? key, required this.listofJadwalKuliah}) : super(key: key);
  ExpandedTileController expandedTileController = ExpandedTileController();

  @override
  Widget build(BuildContext context) {
    List<String> nameOfDay = ["Mon", "Tue", "Wed", "Thurs", "Fri", "Sat"];
    return Container(
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: SizeConfig.blockVertical(2),
              left: SizeConfig.blockHorizontal(5),
            ),
            child: Text(
              "Schedule",
              style:
                  blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: EdgeInsets.only(
                  top: SizeConfig.blockVertical(1),
                  left: SizeConfig.blockHorizontal(5),
                  right: SizeConfig.blockHorizontal(5)),
              child: Row(
                children: [
                  ButtonDay(nameOfDay: "Monday", status: 1, id: "Monday"),
                  ButtonDay(nameOfDay: "Tuesday", status: 1, id: "Tuesday"),
                  ButtonDay(nameOfDay: "Wednesday", status: 1, id: "Wednesday"),
                  ButtonDay(nameOfDay: "Thursday", status: 1, id: 'Thursday'),
                  ButtonDay(nameOfDay: "Friday", status: 1, id: "Friday"),
                  ButtonDay(nameOfDay: "Saturday", status: 1, id: "Saturday")
                ],
              ),
            ),
          ),
          BlocBuilder<LectureSelectorCubit, LectureSelectorState>(
            builder: (context, state) {
              if (state is MondayLecture) {
                List<JadwalKuliah> mondayLecture = [];
                for (JadwalKuliah i in listofJadwalKuliah) {
                  if (i.hari == "Senin") {
                    mondayLecture.add(i);
                  }
                }
                if (mondayLecture.isEmpty) {
                  return NullScheduleCard();
                }
                return ScheduleCard(listOfJadwalKuliah: mondayLecture);
              }
              if (state is TuesdayLecture) {
                List<JadwalKuliah> tuesdayLecture = [];
                for (JadwalKuliah i in listofJadwalKuliah) {
                  if (i.hari == "Selasa") {
                    tuesdayLecture.add(i);
                  }
                }
                if (tuesdayLecture.isEmpty) {
                  return NullScheduleCard();
                }
                return ScheduleCard(listOfJadwalKuliah: tuesdayLecture);
              }
              if (state is WednesdayLecture) {
                List<JadwalKuliah> wednesdayLecture = [];
                for (JadwalKuliah i in listofJadwalKuliah) {
                  if (i.hari == "Rabu") {
                    wednesdayLecture.add(i);
                  }
                }
                if (wednesdayLecture.isEmpty) {
                  return NullScheduleCard();
                }
                // return SchedulePage(listofJadwalKuliah: wednesdayLecture);
                return ScheduleCard(listOfJadwalKuliah: wednesdayLecture);
              }
              if (state is ThursdayLecture) {
                List<JadwalKuliah> thursdayLecture = [];
                for (JadwalKuliah i in listofJadwalKuliah) {
                  if (i.hari == "Kamis") {
                    thursdayLecture.add(i);
                  }
                }
                if (thursdayLecture.isEmpty) {
                  return NullScheduleCard();
                }
                return ScheduleCard(listOfJadwalKuliah: thursdayLecture);
              }
              if (state is FridayLecture) {
                List<JadwalKuliah> fridayLecture = [];
                for (JadwalKuliah i in listofJadwalKuliah) {
                  if (i.hari == "Jumat") {
                    fridayLecture.add(i);
                  }
                }
                if (fridayLecture.isEmpty) {
                  return NullScheduleCard();
                }
                return ScheduleCard(listOfJadwalKuliah: fridayLecture);
              }
              if (state is SaturdayLecture) {
                List<JadwalKuliah> saturdayLecture = [];
                for (JadwalKuliah i in listofJadwalKuliah) {
                  if (i.hari == "Sabtu") {
                    saturdayLecture.add(i);
                  }
                }
                if (saturdayLecture.isEmpty) {
                  return NullScheduleCard();
                }
                return ScheduleCard(listOfJadwalKuliah: saturdayLecture);
              }
              return Container();
            },
          ),
          Container(
            margin: EdgeInsets.only(
                top: SizeConfig.blockVertical(5),
                left: SizeConfig.blockHorizontal(5)),
            child: Text(
              "Attendance",
              style:
                  blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
            ),
          ),
          BlocBuilder<AttendanceCubit, AttendanceState>(
            builder: (context, state) {
              if (state is AttendanceLoad) {
                return Center(
                  child: SpinKitFadingCircle(
                    color: kPrimaryColor,
                  ),
                );
              }
              if (state is AttendanceSuccess) {
                // return Container(
                //   child: Center(
                //     child:
                //         Text("${state.absensiModel.absensi[0].namaMatakuliah}"),
                //   ),
                // );
                return Column(
                  children: [
                    ExpandedTileList.builder(
                        itemCount: state.absensiModel.absensi.length,
                        itemBuilder: (context, index, expandedTileController) {
                          return ExpandedTile(
                              contentSeperator: 2,
                              title: Text(
                                "${state.absensiModel.absensi[index].namaMatakuliah}",
                                style:
                                    blackTextStyle.copyWith(fontWeight: medium),
                              ),
                              content: Container(
                                padding: EdgeInsets.only(
                                    top: SizeConfig.blockVertical(2),
                                    bottom: SizeConfig.blockVertical(2),
                                    left: SizeConfig.blockHorizontal(5),
                                    right: SizeConfig.blockHorizontal(5)),
                                decoration: BoxDecoration(
                                    color: kWhiteColor,
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(
                                        color: kPrimaryColor, width: 1)),
                                margin: EdgeInsets.only(
                                    left: SizeConfig.blockHorizontal(2),
                                    right: SizeConfig.blockHorizontal(2)),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left:
                                                SizeConfig.blockHorizontal(1)),
                                        child: Text(
                                          "${state.absensiModel.absensi[index].kodeMatakuliah}",
                                          style: blackTextStyle.copyWith(
                                              fontWeight: semiBold),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left:
                                                SizeConfig.blockHorizontal(1)),
                                        child: Text(
                                          "${state.absensiModel.absensi[index].namaMatakuliah}",
                                          style: blackTextStyle.copyWith(
                                              fontWeight: semiBold),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom: SizeConfig.blockVertical(1),
                                            top: SizeConfig.blockVertical(2)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              width: SizeConfig.blockHorizontal(
                                                  20),
                                              padding: EdgeInsets.only(
                                                  top: 10,
                                                  right: 10,
                                                  left: 10,
                                                  bottom: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  border: Border.all(
                                                      color: kPrimaryColor,
                                                      width: 1)),
                                              child: Column(children: [
                                                Text(
                                                  "Week 1",
                                                  style:
                                                      blackTextStyle.copyWith(
                                                          fontWeight: semiBold),
                                                ),
                                                Text(
                                                    "${state.absensiModel.absensi[index].absen1}")
                                              ]),
                                            ),
                                            Container(
                                              width: SizeConfig.blockHorizontal(
                                                  20),
                                              padding: EdgeInsets.only(
                                                  top: 10,
                                                  right: 10,
                                                  left: 10,
                                                  bottom: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  border: Border.all(
                                                      color: kPrimaryColor,
                                                      width: 1)),
                                              child: Column(children: [
                                                Text(
                                                  "Week 2",
                                                  style:
                                                      blackTextStyle.copyWith(
                                                          fontWeight: semiBold),
                                                ),
                                                Text(
                                                    "${state.absensiModel.absensi[index].absen2}")
                                              ]),
                                            ),
                                            Container(
                                              width: SizeConfig.blockHorizontal(
                                                  20),
                                              padding: EdgeInsets.only(
                                                  top: 10,
                                                  right: 10,
                                                  left: 10,
                                                  bottom: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  border: Border.all(
                                                      color: kPrimaryColor,
                                                      width: 1)),
                                              child: Column(children: [
                                                Text(
                                                  "Week 3",
                                                  style:
                                                      blackTextStyle.copyWith(
                                                          fontWeight: semiBold),
                                                ),
                                                Text(
                                                    "${state.absensiModel.absensi[index].absen3}")
                                              ]),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom:
                                                SizeConfig.blockVertical(1)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              width: SizeConfig.blockHorizontal(
                                                  20),
                                              padding: EdgeInsets.only(
                                                  top: 10,
                                                  right: 10,
                                                  left: 10,
                                                  bottom: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  border: Border.all(
                                                      color: kPrimaryColor,
                                                      width: 1)),
                                              child: Column(children: [
                                                Text(
                                                  "Week 4",
                                                  style:
                                                      blackTextStyle.copyWith(
                                                          fontWeight: semiBold),
                                                ),
                                                Text(
                                                    "${state.absensiModel.absensi[index].absen4}")
                                              ]),
                                            ),
                                            Container(
                                              width: SizeConfig.blockHorizontal(
                                                  20),
                                              padding: EdgeInsets.only(
                                                  top: 10,
                                                  right: 10,
                                                  left: 10,
                                                  bottom: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  border: Border.all(
                                                      color: kPrimaryColor,
                                                      width: 1)),
                                              child: Column(children: [
                                                Text(
                                                  "Week 5",
                                                  style:
                                                      blackTextStyle.copyWith(
                                                          fontWeight: semiBold),
                                                ),
                                                Text(
                                                    "${state.absensiModel.absensi[index].absen5}")
                                              ]),
                                            ),
                                            Container(
                                              width: SizeConfig.blockHorizontal(
                                                  20),
                                              padding: EdgeInsets.only(
                                                  top: 10,
                                                  right: 10,
                                                  left: 10,
                                                  bottom: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  border: Border.all(
                                                      color: kPrimaryColor,
                                                      width: 1)),
                                              child: Column(children: [
                                                Text(
                                                  "Week 6",
                                                  style:
                                                      blackTextStyle.copyWith(
                                                          fontWeight: semiBold),
                                                ),
                                                Text(
                                                    "${state.absensiModel.absensi[index].absen6}")
                                              ]),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom:
                                                SizeConfig.blockVertical(1)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              width: SizeConfig.blockHorizontal(
                                                  20),
                                              padding: EdgeInsets.only(
                                                  top: 10,
                                                  right: 10,
                                                  left: 10,
                                                  bottom: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  border: Border.all(
                                                      color: kPrimaryColor,
                                                      width: 1)),
                                              child: Column(children: [
                                                Text(
                                                  "Week 7",
                                                  style:
                                                      blackTextStyle.copyWith(
                                                          fontWeight: semiBold),
                                                ),
                                                Text(
                                                    "${state.absensiModel.absensi[index].absen7}")
                                              ]),
                                            ),
                                            Container(
                                              width: SizeConfig.blockHorizontal(
                                                  20),
                                              padding: EdgeInsets.only(
                                                  top: 10,
                                                  right: 10,
                                                  left: 10,
                                                  bottom: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  border: Border.all(
                                                      color: kPrimaryColor,
                                                      width: 1)),
                                              child: Column(children: [
                                                Text(
                                                  "Week 8",
                                                  style:
                                                      blackTextStyle.copyWith(
                                                          fontWeight: semiBold),
                                                ),
                                                Text(
                                                    "${state.absensiModel.absensi[index].absen8}")
                                              ]),
                                            ),
                                            Container(
                                              width: SizeConfig.blockHorizontal(
                                                  20),
                                              padding: EdgeInsets.only(
                                                  top: 10,
                                                  right: 10,
                                                  left: 10,
                                                  bottom: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  border: Border.all(
                                                      color: kPrimaryColor,
                                                      width: 1)),
                                              child: Column(children: [
                                                Text(
                                                  "Week 9",
                                                  style:
                                                      blackTextStyle.copyWith(
                                                          fontWeight: semiBold),
                                                ),
                                                Text(
                                                    "${state.absensiModel.absensi[index].absen9}")
                                              ]),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom:
                                                SizeConfig.blockVertical(1)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              width: SizeConfig.blockHorizontal(
                                                  20),
                                              padding: EdgeInsets.only(
                                                  top: 10,
                                                  right: 10,
                                                  left: 10,
                                                  bottom: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  border: Border.all(
                                                      color: kPrimaryColor,
                                                      width: 1)),
                                              child: Column(children: [
                                                Text(
                                                  "Week 10",
                                                  style:
                                                      blackTextStyle.copyWith(
                                                          fontWeight: semiBold),
                                                ),
                                                Text(
                                                    "${state.absensiModel.absensi[index].absen10}")
                                              ]),
                                            ),
                                            Container(
                                              width: SizeConfig.blockHorizontal(
                                                  20),
                                              padding: EdgeInsets.only(
                                                  top: 10,
                                                  right: 10,
                                                  left: 10,
                                                  bottom: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  border: Border.all(
                                                      color: kPrimaryColor,
                                                      width: 1)),
                                              child: Column(children: [
                                                Text(
                                                  "Week 11",
                                                  style:
                                                      blackTextStyle.copyWith(
                                                          fontWeight: semiBold),
                                                ),
                                                Text(
                                                    "${state.absensiModel.absensi[index].absen11}")
                                              ]),
                                            ),
                                            Container(
                                              width: SizeConfig.blockHorizontal(
                                                  20),
                                              padding: EdgeInsets.only(
                                                  top: 10,
                                                  right: 10,
                                                  left: 10,
                                                  bottom: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  border: Border.all(
                                                      color: kPrimaryColor,
                                                      width: 1)),
                                              child: Column(children: [
                                                Text(
                                                  "Week 12",
                                                  style:
                                                      blackTextStyle.copyWith(
                                                          fontWeight: semiBold),
                                                ),
                                                Text(
                                                    "${state.absensiModel.absensi[index].absen12}")
                                              ]),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom:
                                                SizeConfig.blockVertical(1)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              width: SizeConfig.blockHorizontal(
                                                  20),
                                              padding: EdgeInsets.only(
                                                  top: 10,
                                                  right: 10,
                                                  left: 10,
                                                  bottom: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  border: Border.all(
                                                      color: kPrimaryColor,
                                                      width: 1)),
                                              child: Column(children: [
                                                Text(
                                                  "Week 13",
                                                  style:
                                                      blackTextStyle.copyWith(
                                                          fontWeight: semiBold),
                                                ),
                                                Text(
                                                    "${state.absensiModel.absensi[index].absen13}")
                                              ]),
                                            ),
                                            Container(
                                              width: SizeConfig.blockHorizontal(
                                                  20),
                                              padding: EdgeInsets.only(
                                                  top: 10,
                                                  right: 10,
                                                  left: 10,
                                                  bottom: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  border: Border.all(
                                                      color: kPrimaryColor,
                                                      width: 1)),
                                              child: Column(children: [
                                                Text(
                                                  "Week 14",
                                                  style:
                                                      blackTextStyle.copyWith(
                                                          fontWeight: semiBold),
                                                ),
                                                Text(
                                                    "${state.absensiModel.absensi[index].absen14}")
                                              ]),
                                            ),
                                            Container(
                                              width: SizeConfig.blockHorizontal(
                                                  20),
                                              padding: EdgeInsets.only(
                                                  top: 10,
                                                  right: 10,
                                                  left: 10,
                                                  bottom: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  border: Border.all(
                                                      color: kPrimaryColor,
                                                      width: 1)),
                                              child: Column(children: [
                                                Text(
                                                  "Week 15",
                                                  style:
                                                      blackTextStyle.copyWith(
                                                          fontWeight: semiBold),
                                                ),
                                                Text(
                                                    "${state.absensiModel.absensi[index].absen15}")
                                              ]),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                              ),
                              controller: expandedTileController);
                        })
                  ],
                );
              }
              if (state is AttendanceFail) {
                return Container(
                  child: Text("${state.attendanceFailModel.result}"),
                );
              }
              return Container(
                  margin: EdgeInsets.only(left: SizeConfig.blockHorizontal(5)),
                  child: Text(
                      "Attendance feature will be implemented at Iteration 3"));
            },
          ),
        ],
      ),
    );
  }
}
