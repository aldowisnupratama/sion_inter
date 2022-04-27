import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sion_inter/cubit/reset_ms_teams/resetmsteams_cubit.dart';
import 'package:sion_inter/ui/ui.dart';
import 'package:sion_inter/ui/widgets/textformfield_widgets.dart';

import '../../shared/shared.dart';

class ResetMsPasswordPage extends StatelessWidget {
  ResetMsPasswordPage({Key? key}) : super(key: key);

  TextEditingController birthPlaceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: SizeConfig.blockVertical(3),
                left: SizeConfig.blockHorizontal(6),
                right: SizeConfig.blockHorizontal(6)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: SizeConfig.blockHorizontal(11),
                    height: SizeConfig.blockVertical(11),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/icons/blueBtnBack.png"))),
                  ),
                ),
                Text(
                  "RESET PASSWORD",
                  style: darkBlueTextStyle.copyWith(
                      wordSpacing: 2, fontSize: 16, fontWeight: bold),
                ),
                SizedBox(
                  height: 40,
                  width: 40,
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              margin: EdgeInsets.only(
                top: SizeConfig.blockVertical(5),
                left: SizeConfig.blockHorizontal(5),
                right: SizeConfig.blockHorizontal(5),
              ),
              child: Column(
                children: [
                  CostumeTextFormField(
                      hintText: "Denpasar",
                      textformfieldName: "Birth Place",
                      controller: birthPlaceController),
                  BlocConsumer<ResetMsTeamsCubit, ResetmsteamsState>(
                    listener: (context, state) {
                      if (state is ResetMsTeamsSuccess) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return ShowDialogWidget.dialogWidget(
                                  Icons.announcement,
                                  kGreenColor,
                                  "Instructions for resetting the Microsoft Teams password will be sent to the email registered in the biodata a maximum of 1x24 hours.",
                                  CostumeButton(
                                      width: SizeConfig.blockHorizontal(40),
                                      height: SizeConfig.blockVertical(5),
                                      buttonName: Text(
                                        "OK",
                                        style: whiteTextStyle,
                                      ),
                                      color: kPrimaryColor,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      }));
                            });
                      }
                      if (state is ResetMsTeamsFail) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return ShowDialogWidget.dialogWidget(
                                  Icons.announcement,
                                  Colors.red,
                                  "Place of birth does not match. Please adjust the writing (capital letters, punctuation, etc.)",
                                  CostumeButton(
                                      width: SizeConfig.blockHorizontal(40),
                                      height: SizeConfig.blockVertical(5),
                                      buttonName: Text(
                                        "OK",
                                        style: whiteTextStyle,
                                      ),
                                      color: kPrimaryColor,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      }));
                            });
                      }
                    },
                    builder: (context, state) {
                      if (state is ResetMsTeamsLoad) {
                        return Center(
                          child: SpinKitFadingCircle(
                            color: kPrimaryColor,
                          ),
                        );
                      }
                      return CostumeButton(
                        buttonName: Text(
                          "Reset Ms Teams Password",
                          style: whiteTextStyle.copyWith(
                              fontSize: 17, fontWeight: semiBold),
                        ),
                        color: kPrimaryColor,
                        width: SizeConfig.blockVertical(40),
                        height: SizeConfig.blockHorizontal(15),
                        onPressed: () {
                          context
                              .read<ResetMsTeamsCubit>()
                              .resetPassword(birthPlaceController.text);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
