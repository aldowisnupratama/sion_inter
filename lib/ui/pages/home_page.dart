import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:sion_inter/cubit/cubit.dart';
import 'package:sion_inter/model/model.dart';
import 'package:sion_inter/shared/shared.dart';
import 'package:sion_inter/ui/pages/final_project_page.dart';
import 'package:sion_inter/ui/pages/final_test_pages.dart';
import 'package:sion_inter/ui/ui.dart';

class HomePage extends StatefulWidget {
  final ZoomDrawerController drawerController;

  const HomePage({Key? key, required this.drawerController}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget gpaDetails(List<GPA> gpas) {
      return Container(
        margin: EdgeInsets.only(top: SizeConfig.blockVertical(2)),
        child: Column(
          children: gpas.map((GPA gpa) {
            return GPATile(gpa: gpa);
          }).toList(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          new IconButton(
              onPressed: () {
                Navigator.pushNamed(context, findPages);
              },
              icon: Icon(Icons.search))
        ],
        backgroundColor: kPrimaryColor,
        leading: InkWell(
            onTap: () => widget.drawerController.toggle!(),
            child: Icon(Icons.menu)),
      ),
      body: BlocBuilder<PageCubit, PageState>(
        builder: (context, state) {
          if (state is AnnouncementPageState) {
            return BlocBuilder<AnnouncementCubit, AnnouncementState>(
              builder: (context, state) {
                if (state is AnnouncementLoading) {
                  return Center(
                    child: SpinKitCircle(
                      color: kPrimaryColor,
                    ),
                  );
                }
                if (state is AnnouncementInvalid) {
                  return Center(
                    child: Container(
                      child: Text("${state.message}"),
                    ),
                  );
                }
                if (state is AnnouncementValid) {
                  return AnnoucementPage(
                    listOfPengumuman: state.announcementModel,
                  );
                }
                return Container(
                  child: Center(
                    child: Text("announcement page"),
                  ),
                );
              },
            );
          }
          if (state is SchedulePageState) {
            return BlocBuilder<ScheduleCubit, ScheduleState>(
              builder: (context, state) {
                if (state is ScheduleLoad) {
                  return Center(
                    child: SpinKitFadingCircle(color: kPrimaryColor),
                  );
                }
                if (state is ScheduleFail) {
                  return Center(
                    child: Text("${state.errorMessage}"),
                  );
                }
                if (state is ScheduleSuccess) {
                  return SchedulePage(
                    listofJadwalKuliah: state.listOfJadwalKuliah,
                  );
                }
                return Container(
                  child: Center(
                    child: Text("Schedule page"),
                  ),
                );
              },
            );
          }
          if (state is FinalProjectPageState) {
            return BlocBuilder<FinalProjectTopicCubit, FinalProjectTopicState>(
              builder: (context, state) {
                if (state is FinalProjectTopicLoad) {
                  return Center(
                    child: SpinKitCircle(
                      color: kPrimaryColor,
                    ),
                  );
                }
                if (state is FinalProjectTopicFail) {
                  return Center(
                    child: Text("${state.errorMessage}"),
                  );
                }
                if (state is FinalProjectTopicSuccess) {
                  return FinalProjectsPage(
                    finalProjectTopic: state.finalProjectTopic,
                  );
                }
                return Center(
                  child: Text("Final Project Topics"),
                );
              },
            );
          }
          if (state is GPAPageState) {
            return BlocBuilder<GpaCubit, GpaState>(
              builder: (context, state) {
                if (state is GpaLoading) {
                  return Center(
                    child: SpinKitCircle(
                      color: kPrimaryColor,
                    ),
                  );
                }
                if (state is GpaSuccess) {
                  return SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(color: kPrimaryColor),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockVertical(2)),
                            width: SizeConfig.blockHorizontal(30),
                            height: SizeConfig.blockVertical(10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/report_image.png"))),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: SizeConfig.blockVertical(3),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: kWhiteColor,
                            ),
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: SizeConfig.blockHorizontal(3),
                                  right: SizeConfig.blockHorizontal(3),
                                  bottom: SizeConfig.blockVertical(4)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: SizeConfig.blockVertical(1)),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "GPA History",
                                          style: blackTextStyle.copyWith(
                                            fontSize: 24,
                                            fontWeight: semiBold,
                                          ),
                                        )),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: SizeConfig.blockVertical(1)),
                                    width: double.infinity,
                                    height: SizeConfig.blockVertical(40),
                                    // decoration: BoxDecoration(
                                    //     borderRadius: BorderRadius.circular(18),
                                    //     border:
                                    //         Border.all(width: 1, color: kPrimaryColor)),
                                    child: CostumeGPALineCharts(
                                      listOfGPA: state.gpa,
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Axis: Semester",
                                          style: blackTextStyle.copyWith(
                                              fontSize: 8),
                                        ),
                                        Text(
                                          "Ordinat: GPA",
                                          style: blackTextStyle.copyWith(
                                              fontSize: 8),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: SizeConfig.blockVertical(1)),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Details',
                                        style: blackTextStyle.copyWith(
                                            fontSize: 16, fontWeight: semiBold),
                                      ),
                                    ),
                                  ),
                                  gpaDetails(state.gpa)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                if (state is GpaFailed) {
                  return Center(
                    child: Text("${state.errorMessage}"),
                  );
                }
                return Container(
                  child: Center(
                    child: Text("GPA History"),
                  ),
                );
              },
            );
          }
          if (state is FinalTestPageState) {
            return BlocBuilder<FinalTestCubit, FinalTestState>(
              builder: (context, state) {
                if (state is FinalTestSuccess) {
                  return FinalTestPage(listOfUas: state.listOfUas);
                }
                if (state is FinalTestLoading) {
                  return SpinKitCircle(
                    color: kPrimaryColor,
                  );
                }
                if (state is FinalTestFailed) {
                  return SizedBox();
                }
                return SizedBox();
              },
            );
          }

          return Container(
            child: Center(
              child: Text("zonk"),
            ),
          );
        },
      ),
    );
  }
}
