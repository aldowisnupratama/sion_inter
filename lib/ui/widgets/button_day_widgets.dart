import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit.dart';
import '../../shared/shared.dart';

class ButtonDay extends StatelessWidget {
  final String nameOfDay;
  final int status;
  final String id;
  ButtonDay(
      {Key? key,
      required this.nameOfDay,
      required this.status,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SelectedDayCubit>().isSelected(id);

    bodyColor() {
      if (isSelected) {
        return kPrimaryColor;
      } else {
        return Colors.transparent;
      }
    }

    textColor() {
      if (isSelected) {
        return whiteTextStyle.copyWith(fontWeight: semiBold);
      } else {
        return darkBlueTextStyle.copyWith(fontWeight: semiBold);
      }
    }

    return GestureDetector(
      onTap: () {
        switch (id) {
          case "Monday":
            context
                .read<LectureSelectorCubit>()
                .changeLectureList(MondayLecture());
            context.read<SelectedDayCubit>().selectDay(id);
            break;
          case "Tuesday":
            context
                .read<LectureSelectorCubit>()
                .changeLectureList(TuesdayLecture());
            context.read<SelectedDayCubit>().selectDay(id);
            break;
          case "Wednesday":
            context
                .read<LectureSelectorCubit>()
                .changeLectureList(WednesdayLecture());
            context.read<SelectedDayCubit>().selectDay(id);
            break;
          case "Thursday":
            context
                .read<LectureSelectorCubit>()
                .changeLectureList(ThursdayLecture());
            context.read<SelectedDayCubit>().selectDay(id);
            break;
          case "Friday":
            context
                .read<LectureSelectorCubit>()
                .changeLectureList(FridayLecture());
            context.read<SelectedDayCubit>().selectDay(id);
            break;
          case "Saturday":
            context
                .read<LectureSelectorCubit>()
                .changeLectureList(SaturdayLecture());
            context.read<SelectedDayCubit>().selectDay(id);
            break;
        }
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: kPrimaryColor, width: 2),
            color: bodyColor(),
            borderRadius: BorderRadius.circular(18)),
        margin: EdgeInsets.only(right: SizeConfig.blockHorizontal(4)),
        padding: EdgeInsets.only(
          left: SizeConfig.blockHorizontal(5),
          right: SizeConfig.blockHorizontal(5),
          top: SizeConfig.blockVertical(4),
          bottom: SizeConfig.blockVertical(4),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            nameOfDay,
            style: textColor(),
          )
        ]),
      ),
    );
  }
}
