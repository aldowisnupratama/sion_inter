import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sion_inter/cubit/cubit.dart';
import 'package:sion_inter/model/model.dart';
import 'package:http/http.dart';
import 'package:sion_inter/services/wilayah_service.dart';
import 'package:sion_inter/shared/shared.dart';

import '../ui.dart';

class UpdateBiodataDikti extends StatefulWidget {
  const UpdateBiodataDikti({Key? key}) : super(key: key);

  @override
  State<UpdateBiodataDikti> createState() => _UpdateBiodataDiktiState();
}

class _UpdateBiodataDiktiState extends State<UpdateBiodataDikti> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController ponselController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController kelurahanController = TextEditingController();
  final TextEditingController orangtuaController = TextEditingController();

  String prov = "";
  String kab = "";
  String kec = "";

  @override
  void initState() {
    super.initState();
  }

  Future<List<Wilayah>> getProv() async {
    try {
      var provs = await WilayahService().getProv();
      return provs;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Wilayah>> getKab(String prov) async {
    try {
      var kabs = await WilayahService().getKabs(prov);
      return kabs;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Wilayah>> getKec(String kab) async {
    try {
      var kecs = await WilayahService().getKec(kab);
      return kecs;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        margin: EdgeInsets.only(
            top: SizeConfig.blockVertical(4),
            left: SizeConfig.blockHorizontal(6),
            bottom: SizeConfig.blockVertical(8),
            right: SizeConfig.blockHorizontal(6)),
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(width: 2, color: kPrimaryColor)),
        child: Padding(
          padding: EdgeInsets.only(
              top: SizeConfig.blockVertical(2),
              left: SizeConfig.blockHorizontal(5),
              right: SizeConfig.blockHorizontal(5),
              bottom: SizeConfig.blockVertical(4)),
          child: Container(
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "NIK",
                              style: blackTextStyle.copyWith(
                                  fontWeight: semiBold, letterSpacing: 1),
                            ),
                            SizedBox(height: 6),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please fill in the NIK field";
                                } else {
                                  if (!value.isValidNIK()) {
                                    return "Please fill in the correct NIK";
                                  }
                                }
                                return null;
                              },
                              controller: nikController,
                              cursorColor: Colors.blue[900],
                              keyboardType: TextInputType.text,
                              inputFormatters: [
                                FilteringTextInputFormatter.singleLineFormatter
                              ],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: kPrimaryColor),
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
                              "Name",
                              style: blackTextStyle.copyWith(
                                  fontWeight: semiBold, letterSpacing: 1),
                            ),
                            SizedBox(height: 6),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please fill in the name field";
                                }
                                return null;
                              },
                              controller: namaController,
                              cursorColor: Colors.blue[900],
                              keyboardType: TextInputType.text,
                              inputFormatters: [
                                FilteringTextInputFormatter.singleLineFormatter
                              ],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: kPrimaryColor),
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
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: kPrimaryColor),
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
                              controller: alamatController,
                              cursorColor: Colors.blue[900],
                              keyboardType: TextInputType.text,
                              inputFormatters: [
                                FilteringTextInputFormatter.singleLineFormatter
                              ],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: kPrimaryColor),
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
                              "Village",
                              style: blackTextStyle.copyWith(
                                  fontWeight: semiBold, letterSpacing: 1),
                            ),
                            SizedBox(height: 6),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please fill in the name field";
                                }
                                return null;
                              },
                              controller: kelurahanController,
                              cursorColor: Colors.blue[900],
                              keyboardType: TextInputType.text,
                              inputFormatters: [
                                FilteringTextInputFormatter.singleLineFormatter
                              ],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: kPrimaryColor),
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
                              "Mother's Name",
                              style: blackTextStyle.copyWith(
                                  fontWeight: semiBold, letterSpacing: 1),
                            ),
                            SizedBox(height: 6),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please fill in the name field";
                                }
                                return null;
                              },
                              controller: orangtuaController,
                              cursorColor: Colors.blue[900],
                              keyboardType: TextInputType.text,
                              inputFormatters: [
                                FilteringTextInputFormatter.singleLineFormatter
                              ],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: kPrimaryColor),
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
                              "Province",
                              style: blackTextStyle.copyWith(
                                  fontWeight: semiBold, letterSpacing: 1),
                            ),
                            SizedBox(height: 6),
                            DropdownSearch<Wilayah>(
                              itemAsString: (Wilayah? u) => u!.namaWilayah,
                              maxHeight: SizeConfig.blockVertical(30),
                              onFind: (String? filter) => getProv(),
                              dropdownSearchDecoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: kPrimaryColor),
                                    borderRadius: BorderRadius.circular(18)),
                              ),
                              onChanged: (Wilayah? u) {
                                setState(() {
                                  prov = u!.kodeWilayah;
                                });
                                ;
                              },
                            ),
                          ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "District",
                              style: blackTextStyle.copyWith(
                                  fontWeight: semiBold, letterSpacing: 1),
                            ),
                            SizedBox(height: 6),
                            DropdownSearch<Wilayah>(
                              enabled: (prov.isNotEmpty ? true : false),
                              itemAsString: (Wilayah? u) => u!.namaWilayah,
                              maxHeight: SizeConfig.blockVertical(30),
                              onFind: (String? filter) => getKab(prov),
                              dropdownSearchDecoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: kPrimaryColor),
                                    borderRadius: BorderRadius.circular(18)),
                              ),
                              onChanged: (Wilayah? u) {
                                setState(() {
                                  kab = u!.kodeWilayah;
                                });
                                ;
                              },
                            ),
                          ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sub-District",
                              style: blackTextStyle.copyWith(
                                  fontWeight: semiBold, letterSpacing: 1),
                            ),
                            SizedBox(height: 6),
                            DropdownSearch<Wilayah>(
                              enabled: (kab.isNotEmpty ? true : false),
                              itemAsString: (Wilayah? u) => u!.namaWilayah,
                              maxHeight: SizeConfig.blockVertical(30),
                              onFind: (String? filter) => getKec(kab),
                              dropdownSearchDecoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: kPrimaryColor),
                                    borderRadius: BorderRadius.circular(18)),
                              ),
                              onChanged: (Wilayah? u) {
                                setState(() {
                                  kec = u!.kodeWilayah;
                                });
                                ;
                              },
                            ),
                          ]),
                    ),
                    BlocConsumer<UpdateBiodataDiktiCubit,
                        UpdateBiodataDiktiState>(
                      listener: (context, state) {
                        if (state is UpdateBiodataDiktiSucces) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return WillPopScope(
                                  onWillPop: () async => false,
                                  child: ShowDialogWidget.dialogWidget(
                                      Icons.announcement,
                                      kPrimaryColor,
                                      "Dikti Biodata Succesfully Updated\t",
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
                                          })),
                                );
                              });
                        }
                        if (state is UpdateBiodataDiktiFail) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return ShowDialogWidget.dialogWidget(
                                    Icons.announcement,
                                    kRedColor,
                                    "Can't change the your biodata\n ${state.errorMessage.toString()}",
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
                        if (state is UpdateBiodataDiktiLoad) {
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
                            "Update Dikti Biodata",
                            style: whiteTextStyle.copyWith(
                                fontSize: 18, fontWeight: semiBold),
                          ),
                          color: kPrimaryColor,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (prov.isNotEmpty &&
                                  kab.isNotEmpty &&
                                  kec.isNotEmpty) {
                                context
                                    .read<UpdateBiodataDiktiCubit>()
                                    .updateBiodataDikti(
                                        nikController.text.trim(),
                                        namaController.text.trim(),
                                        ponselController.text.trim(),
                                        alamatController.text.trim(),
                                        kelurahanController.text.trim(),
                                        prov,
                                        kab,
                                        kec,
                                        orangtuaController.text.trim());
                              }
                            }
                          },
                        );
                      },
                    )
                  ],
                )),
          ),
        ),
      ),
    ]);
  }
}
