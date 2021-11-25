import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:sion_inter/cubit/cubit.dart';
import 'package:sion_inter/shared/shared.dart';

class DrawerMenu extends StatefulWidget {
  final ZoomDrawerController drawerController;
  const DrawerMenu({Key? key, required this.drawerController})
      : super(key: key);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  late var pageCubit;
  @override
  void initState() {
    pageCubit = PageCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: SafeArea(
            child: Container(
          margin: EdgeInsets.only(
              top: SizeConfig.blockVertical(4),
              left: SizeConfig.blockHorizontal(7),
              right: SizeConfig.blockHorizontal(50),
              bottom: SizeConfig.blockVertical(10)),
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
                  Icons.person,
                  color: kWhiteColor,
                ),
                title: Text(
                  "Home",
                  style: whiteTextStyle,
                ),
                onTap: () {
                  BlocProvider.of<PageCubit>(context)
                      .changePage(AnnouncementPageState(title: "Announcement"));
                  widget.drawerController.close!();
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: kWhiteColor,
                ),
                title: Text(
                  "Schedule",
                  style: whiteTextStyle,
                ),
                onTap: () {
                  BlocProvider.of<PageCubit>(context)
                      .changePage(SchedulePageState(title: "Schedule Page"));
                  widget.drawerController.close!();
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: kWhiteColor,
                ),
                title: Text(
                  "Home",
                  style: whiteTextStyle,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: kWhiteColor,
                ),
                title: Text(
                  "Home",
                  style: whiteTextStyle,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: kWhiteColor,
                ),
                title: Text(
                  "Home",
                  style: whiteTextStyle,
                ),
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
                  onTap: () {},
                  leading: Icon(
                    Icons.exit_to_app_rounded,
                    color: kWhiteColor,
                  ),
                  title: Text(
                    "Sign Out",
                    style: whiteTextStyle,
                  ))
            ],
          ),
        )));
  }
}
