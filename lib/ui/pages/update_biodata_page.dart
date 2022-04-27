import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sion_inter/cubit/update_biodata/update_biodata_cubit.dart';
import 'package:sion_inter/shared/shared.dart';
import 'package:sion_inter/ui/ui.dart';

class UpdateBiodataPage extends StatelessWidget {
  String? email;
  String? nisn;
  String? address;
  String? phoneNumber;
  String? facebookLink;
  String? twitterLink;
  UpdateBiodataPage(
      {Key? key,
      required this.email,
      required this.nisn,
      required this.facebookLink,
      required this.phoneNumber,
      required this.address,
      required this.twitterLink})
      : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController nisnController = TextEditingController();
  TextEditingController ponselController = TextEditingController();
  TextEditingController facebookController = TextEditingController();
  TextEditingController twitterController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    emailController.text = (this.email == null ? "" : this.email!);
    nisnController.text = (this.nisn == null ? "" : this.nisn!);
    ponselController.text = (this.phoneNumber == null ? "" : this.phoneNumber!);
    facebookController.text =
        (this.facebookLink == null ? "" : this.facebookLink!);
    twitterController.text =
        (this.twitterLink == null ? "" : this.twitterLink!);
    addressController.text = (this.address == null ? "" : this.address!);

    final _formKey = GlobalKey<FormState>();

    Widget header() {
      return Container(
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
              "UPDATE BIODATA",
              style: darkBlueTextStyle.copyWith(
                  wordSpacing: 2, fontSize: 16, fontWeight: semiBold),
            ),
            SizedBox(
              height: 40,
              width: 40,
            )
          ],
        ),
      );
    }

    Widget body() {
      return Container(
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
            bottom: SizeConfig.blockVertical(8),
            right: SizeConfig.blockHorizontal(6)),
        child: Flexible(
          flex: 3,
          child: Form(
            key: _formKey,
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: blackTextStyle.copyWith(
                                fontWeight: semiBold, letterSpacing: 1),
                          ),
                          SizedBox(height: 6),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please fill in the email field";
                              } else {
                                if (!value.isValidEmail()) {
                                  return "Please fill in the correct email";
                                }
                              }
                              return null;
                            },
                            controller: emailController,
                            cursorColor: Colors.blue[900],
                            keyboardType: TextInputType.text,
                            inputFormatters: [
                              FilteringTextInputFormatter.singleLineFormatter
                            ],
                            decoration: InputDecoration(
                              hintText: (this.email != null ? this.email : ""),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kPrimaryColor),
                                  borderRadius: BorderRadius.circular(18)),
                            ),
                          ),
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "NISN",
                            style: blackTextStyle.copyWith(
                                fontWeight: semiBold, letterSpacing: 1),
                          ),
                          SizedBox(height: 6),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please fill in the nisn field";
                              } else {
                                if (value.length != 10) {
                                  return "Please fill in correct nisn";
                                }
                              }
                              return null;
                            },
                            controller: nisnController,
                            cursorColor: Colors.blue[900],
                            keyboardType: TextInputType.text,
                            inputFormatters: [
                              FilteringTextInputFormatter.singleLineFormatter
                            ],
                            decoration: InputDecoration(
                              hintText: (this.nisn != null ? this.nisn : ""),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kPrimaryColor),
                                  borderRadius: BorderRadius.circular(18)),
                            ),
                          )
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Phone Number",
                            style: blackTextStyle.copyWith(
                                fontWeight: semiBold, letterSpacing: 1),
                          ),
                          SizedBox(height: 6),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please fill in the phone number field";
                              } else {
                                if (value.isValidPhoneNumber() == false) {
                                  return "Please fill in the correct phone number";
                                }
                              }
                              return null;
                            },
                            controller: ponselController,
                            cursorColor: Colors.blue[900],
                            keyboardType: TextInputType.text,
                            inputFormatters: [
                              FilteringTextInputFormatter.singleLineFormatter
                            ],
                            decoration: InputDecoration(
                              hintText: (this.phoneNumber != null
                                  ? this.phoneNumber
                                  : ""),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kPrimaryColor),
                                  borderRadius: BorderRadius.circular(18)),
                            ),
                          )
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Address",
                            style: blackTextStyle.copyWith(
                                fontWeight: semiBold, letterSpacing: 1),
                          ),
                          SizedBox(height: 6),
                          TextFormField(
                            controller: addressController,
                            cursorColor: Colors.blue[900],
                            keyboardType: TextInputType.text,
                            inputFormatters: [
                              FilteringTextInputFormatter.singleLineFormatter
                            ],
                            decoration: InputDecoration(
                              hintText:
                                  (this.address != null ? this.address : ""),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kPrimaryColor),
                                  borderRadius: BorderRadius.circular(18)),
                            ),
                          )
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Facebook",
                            style: blackTextStyle.copyWith(
                                fontWeight: semiBold, letterSpacing: 1),
                          ),
                          SizedBox(height: 6),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please fill in facebook link field.";
                              } else {
                                if (!value.isValidURL()) {
                                  return "Please fill the correct facebook link.";
                                }
                              }
                              return null;
                            },
                            controller: facebookController,
                            cursorColor: Colors.blue[900],
                            keyboardType: TextInputType.text,
                            inputFormatters: [
                              FilteringTextInputFormatter.singleLineFormatter
                            ],
                            decoration: InputDecoration(
                              hintText: (this.facebookLink != null
                                  ? this.facebookLink
                                  : ""),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kPrimaryColor),
                                  borderRadius: BorderRadius.circular(18)),
                            ),
                          )
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Twitter",
                            style: blackTextStyle.copyWith(
                                fontWeight: semiBold, letterSpacing: 1),
                          ),
                          SizedBox(height: 6),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please fill in twitter link field.";
                              } else {
                                if (!value.isValidURL()) {
                                  return "Please fill the correct twitter link.";
                                }
                              }
                              return null;
                            },
                            controller: twitterController,
                            cursorColor: Colors.blue[900],
                            keyboardType: TextInputType.text,
                            inputFormatters: [
                              FilteringTextInputFormatter.singleLineFormatter
                            ],
                            decoration: InputDecoration(
                              hintText: (this.twitterLink != null
                                  ? this.twitterLink
                                  : ""),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kPrimaryColor),
                                  borderRadius: BorderRadius.circular(18)),
                            ),
                          )
                        ]),
                  ),
                  BlocConsumer<UpdateBiodataCubit, UpdateBiodataState>(
                    listener: (context, state) {
                      if (state is UpdateBiodataValid) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return ShowDialogWidget.dialogWidget(
                                  Icons.announcement,
                                  kPrimaryColor,
                                  "Biodata Succesfully Updated\t",
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
                                        Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            mainScreenPath,
                                            (route) => false);
                                      }));
                            });
                      }
                      if (state is UpdateBiodatalInvalid) {
                        print(state.errorMessage);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return ShowDialogWidget.dialogWidget(
                                  Icons.announcement,
                                  kRedColor,
                                  "Can't change the your biodata",
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
                      if (state is UpdateBiodataLoad) {
                        return Center(
                          child: SpinKitFadingCircle(
                            color: kPrimaryColor,
                          ),
                        );
                      }

                      return CostumeButton(
                        width: SizeConfig.blockHorizontal(70),
                        height: SizeConfig.blockVertical(6),
                        buttonName: Text(
                          "Update Biodata",
                          style: whiteTextStyle.copyWith(
                              fontSize: 18, fontWeight: semiBold),
                        ),
                        color: kPrimaryColor,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<UpdateBiodataCubit>(context)
                                .updateBiodata(
                                    emailController.text,
                                    nisnController.text,
                                    addressController.text,
                                    ponselController.text,
                                    facebookController.text,
                                    twitterController.text);
                          }
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [header(), body()],
        ),
      ),
    );
  }
}
