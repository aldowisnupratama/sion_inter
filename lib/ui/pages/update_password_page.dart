import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sion_inter/cubit/cubit.dart';

import 'package:sion_inter/shared/shared.dart';
import 'package:sion_inter/ui/ui.dart';

class UpdatePasswordPage extends StatefulWidget {
  UpdatePasswordPage({Key? key}) : super(key: key);

  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  TextEditingController password1controller = TextEditingController();

  TextEditingController password2controller = TextEditingController();
  bool isEnable = false;

  void deleteToken() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  void doOpenPage() {
    Navigator.pushNamedAndRemoveUntil(
        context, loginScreenPath, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                              image:
                                  AssetImage("assets/icons/blueBtnBack.png"))),
                    ),
                  ),
                  Text(
                    "UPDATE PASSWORD",
                    style: darkBlueTextStyle.copyWith(
                        wordSpacing: 2, fontSize: 16, fontWeight: semiBold),
                  ),
                  SizedBox(
                    height: 40,
                    width: 40,
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
              padding: EdgeInsets.only(
                  top: SizeConfig.blockVertical(5),
                  bottom: SizeConfig.blockVertical(5),
                  left: SizeConfig.blockHorizontal(4),
                  right: SizeConfig.blockHorizontal(4)),
              margin: EdgeInsets.only(
                  top: SizeConfig.blockVertical(4),
                  left: SizeConfig.blockHorizontal(6),
                  right: SizeConfig.blockHorizontal(6)),
              child: Flexible(
                flex: 3,
                child: Container(
                  child: Column(
                    children: [
                      CostumePasswordField(
                        textformfieldName: "Current Password",
                        controller: password1controller,
                        hintText: "Enter Your Current Password",
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CostumePasswordField(
                        textformfieldName: "New Password",
                        controller: password2controller,
                        hintText: "Enter Your New Password",
                      ),
                      FlutterPwValidator(
                        controller: password2controller,
                        minLength: 8,
                        uppercaseCharCount: 2,
                        numericCharCount: 3,
                        specialCharCount: 1,
                        width: 400,
                        height: 150,
                        onSuccess: () {
                          setState(() {
                            isEnable = true;
                          });
                        },
                        onFail: () {
                          setState(() {
                            isEnable = false;
                          });
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      BlocConsumer<UpdatePasswordCubit, UpdatePasswordState>(
                        listener: (context, state) {
                          if (state is UpdatePasswordInvalid) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return ShowDialogWidget.dialogWidget(
                                      Icons.error,
                                      Colors.red,
                                      "Can't change the password",
                                      CostumeButton(
                                          width: SizeConfig.blockHorizontal(40),
                                          height: SizeConfig.blockVertical(5),
                                          buttonName: Text(
                                            "Close",
                                            style: whiteTextStyle,
                                          ),
                                          color: kPrimaryColor,
                                          onPressed: () {
                                            Navigator.pop(context);
                                          }));
                                });
                          }
                          if (state is UpdatePasswordValid) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return WillPopScope(
                                      child: ShowDialogWidget.dialogWidget(
                                          Icons.announcement,
                                          kGreenColor,
                                          "Password Succesfully Changed\tPlease re-login.",
                                          CostumeButton(
                                              width: SizeConfig.blockHorizontal(
                                                  40),
                                              height:
                                                  SizeConfig.blockVertical(5),
                                              buttonName: Text(
                                                "OK",
                                                style: whiteTextStyle,
                                              ),
                                              color: kPrimaryColor,
                                              onPressed: () {
                                                deleteToken();
                                                Navigator.pop(context);
                                                doOpenPage();
                                              })),
                                      onWillPop: () async => false);
                                });
                          }
                        },
                        builder: (context, state) {
                          if (state is UpdatePasswordLoad) {
                            return Center(
                              child: SpinKitFadingCircle(
                                color: kPrimaryColor,
                              ),
                            );
                          }

                          return CostumeButtonB(
                              width: SizeConfig.blockHorizontal(70),
                              height: SizeConfig.blockVertical(6),
                              buttonName: Text(
                                "Update Password",
                                style: whiteTextStyle.copyWith(
                                    fontSize: 18, fontWeight: semiBold),
                              ),
                              color: kPrimaryColor,
                              onPressed: () {
                                if (password1controller.text.isNotEmpty) {
                                  BlocProvider.of<UpdatePasswordCubit>(context)
                                      .updatePassword(
                                          password1controller.text.trim(),
                                          password2controller.text.trim());
                                }
                              },
                              isEnable: isEnable);
                        },
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
