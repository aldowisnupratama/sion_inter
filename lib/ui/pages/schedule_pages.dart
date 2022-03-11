import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sion_inter/model/schedule_model.dart';
import '../../cubit/cubit.dart';

import 'package:sion_inter/shared/shared.dart';
import 'package:sion_inter/ui/ui.dart';

class SchedulePage extends StatelessWidget {
  final List<JadwalKuliah> listofJadwalKuliah;
  SchedulePage({Key? key, required this.listofJadwalKuliah}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> nameOfDay = ["Mon", "Tue", "Wed", "Thurs", "Fri", "Sat"];
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Container(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                    "Attendance feature will be implemented at Iteration 3")),
          )
        ],
      ),
    );
  }
}
