import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sion_inter/cubit/cubit.dart';
import 'package:sion_inter/shared/shared.dart';

import '../../ui.dart';

class DrawerMenu extends StatefulWidget {
  final ZoomDrawerController drawerController;
  const DrawerMenu({Key? key, required this.drawerController})
      : super(key: key);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  late var pageCubit;
  late var pref;
  @override
  void initState() {
    pageCubit = PageCubit();
    initializePref();

    super.initState();
  }

  void initializePref() async {
    pref = await SharedPreferences.getInstance();
  }

  void clearPref() async {
    await pref.remove("token");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: SafeArea(
            child: Container(
          margin: EdgeInsets.only(
              top: SizeConfig.blockVertical(4),
              left: SizeConfig.blockHorizontal(6),
              right: SizeConfig.blockHorizontal(40),
              bottom: SizeConfig.blockVertical(10)),
          child: Container(
            margin: EdgeInsets.only(right: SizeConfig.blockHorizontal((3))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: IconButton(
                      onPressed: () {
                        widget.drawerController.close!();
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        color: kWhiteColor,
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.blockVertical(3)),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, biodataScreenPath);
                      widget.drawerController.close!();
                    },
                    child: CircleAvatar(
                      backgroundColor: kWhiteColor,
                      radius: SizeConfig.blockHorizontal(10),
                      child: Icon(
                        Icons.person,
                        color: kPrimaryColor,
                        size: SizeConfig.blockVertical(7),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.blockVertical(2)),
                  child: Text(
                    "My Profile",
                    style: whiteTextStyle.copyWith(
                        letterSpacing: 1, fontSize: 14, fontWeight: semiBold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockVertical(1),
                      bottom: SizeConfig.blockVertical(4)),
                  child: Divider(
                    color: kWhiteColor,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: kWhiteColor,
                  ),
                  title: Text(
                    "Home",
                    style: whiteTextStyle,
                  ),
                  onTap: () {
                    BlocProvider.of<PageCubit>(context).changePage(
                        AnnouncementPageState(title: "Announcement"));
                    BlocProvider.of<AnnouncementCubit>(context)
                        .fetchPengumuman();
                    widget.drawerController.close!();
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.schedule,
                    color: kWhiteColor,
                  ),
                  title: Text(
                    "Schedule",
                    style: whiteTextStyle,
                  ),
                  onTap: () {
                    BlocProvider.of<PageCubit>(context)
                        .changePage(SchedulePageState(title: "Schedule Page"));
                    BlocProvider.of<ScheduleCubit>(context).fetchSchedule();

                    widget.drawerController.close!();
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.school_rounded,
                    color: kWhiteColor,
                  ),
                  title: Text(
                    "GPA",
                    style: whiteTextStyle,
                  ),
                  onTap: () {
                    BlocProvider.of<PageCubit>(context)
                        .changePage(GPAPageState(title: "GPA History"));
                    BlocProvider.of<GpaCubit>(context).fetchGPA();
                    widget.drawerController.close!();
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.assignment,
                    color: kWhiteColor,
                  ),
                  title: Text(
                    "Final Test",
                    style: whiteTextStyle,
                  ),
                  onTap: () {
                    BlocProvider.of<PageCubit>(context)
                        .changePage(FinalTestPageState(title: "Final Test"));
                    BlocProvider.of<FinalTestCubit>(context).fetchFinalTest();
                    widget.drawerController.close!();
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.group,
                    color: kWhiteColor,
                  ),
                  title: Text(
                    "FP Topics",
                    style: whiteTextStyle,
                  ),
                  onTap: () {
                    widget.drawerController.close!();
                  },
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockVertical(4),
                      bottom: SizeConfig.blockVertical(1)),
                  child: Divider(
                    color: kWhiteColor,
                  ),
                ),
                ListTile(
                    onTap: () {
                      widget.drawerController.close!();
                      showDialog(
                          context: context,
                          builder: (context) {
                            return ShowDialogWidget.dialogWidget(
                                Icons.help,
                                Colors.yellow,
                                "Are you sure to leave?",
                                ButtonBar(
                                  children: <Widget>[
                                    TextButton(
                                        onPressed: () {
                                          clearPref();
                                          Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              loginScreenPath,
                                              (route) => false);
                                          BlocProvider.of<PageCubit>(context)
                                              .changePage(AnnouncementPageState(
                                                  title: "Announcement"));
                                        },
                                        child: const Text("Yes")),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("No")),
                                  ],
                                ));
                          });
                    },
                    leading: Icon(
                      Icons.exit_to_app_rounded,
                      color: kWhiteColor,
                    ),
                    title: Text(
                      "Log Out",
                      style: whiteTextStyle,
                    ))
              ],
            ),
          ),
        )));
  }
}
