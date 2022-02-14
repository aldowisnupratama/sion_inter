import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sion_inter/cubit/cubit.dart';

import 'package:sion_inter/ui/ui.dart';
import '../../shared/shared.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController nimController = TextEditingController(text: "");

  final TextEditingController passwordController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    Widget stikomLogo() {
      return Stack(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              color: kPrimaryColor,
              height: SizeConfig.blockVertical(50),
              width: SizeConfig.blockVertical(100),
            ),
          ),
          Container(
            height: SizeConfig.blockVertical(30),
            width: SizeConfig.blockHorizontal(100),
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: SizeConfig.blockVertical(10),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/itb_putih.png"),
            )),
          ),
        ],
      );
    }

    Widget formContainer() {
      return Container(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockHorizontal(6),
            vertical: SizeConfig.blockVertical(4)),
        margin: EdgeInsets.only(
            top: SizeConfig.blockVertical(3.5),
            bottom: SizeConfig.blockVertical(3.5),
            left: SizeConfig.blockHorizontal(6),
            right: SizeConfig.blockHorizontal(6)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: kWhiteColor),
        child: Column(
          children: [
            CostumeTextFormField(
              controller: nimController,
              textformfieldName: "NIM",
              hintText: "Enter Your NIM",
              nimTextFormField: true,
            ),
            CostumePasswordField(
              textformfieldName: "Password",
              controller: passwordController,
              hintText: "Enter Your Password",
            ),
            Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return ShowDialogWidget.dialogWidget(
                              Icons.error,
                              Colors.red,
                              "Please contact PUSKOMJAR in the Information System section to change the password",
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
                  },
                  child: Text(
                    "Forget password?",
                    style: lightBlueTextStyle.copyWith(fontWeight: semiBold),
                  ),
                )),
            SizedBox(height: SizeConfig.blockVertical(2)),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginValid) {
                  Navigator.pushReplacementNamed(context, mainScreenPath);
                }
                if (state is LoginInvalid) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return ShowDialogWidget.dialogWidget(
                            Icons.error,
                            Colors.red,
                            "NIM and password do not match",
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
              },
              builder: (context, state) {
                if (state is LoginLoading) {
                  return Center(
                    child: SpinKitFadingCircle(
                      color: kPrimaryColor,
                    ),
                  );
                }
                return CostumeButton(
                  width: SizeConfig.blockHorizontal(60),
                  height: SizeConfig.blockVertical(6),
                  buttonName: Text("Log In",
                      style: whiteTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semiBold,
                          letterSpacing: 1)),
                  color: kPrimaryColor,
                  onPressed: () {
                    if (nimController.text.length == 9) {
                      if (passwordController.text.length >= 8 &&
                          passwordController.text.length <= 20) {
                        context.read<LoginCubit>().loginPost(
                            nimController.text.trim(),
                            passwordController.text.trim());

                        context.read<AnnouncementCubit>().fetchPengumuman();
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return ShowDialogWidget.dialogWidget(
                                  Icons.error,
                                  Colors.red,
                                  "Please enter your NIM and password according to the provisions",
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
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return ShowDialogWidget.dialogWidget(
                                Icons.error,
                                Colors.red,
                                "Please enter your NIM consisting of 9 digits",
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
                  },
                );
              },
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [stikomLogo(), formContainer()],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
