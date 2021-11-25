import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sion_inter/cubit/cubit.dart';
import 'package:sion_inter/shared/shared.dart';
import 'package:sion_inter/ui/ui.dart';
import 'package:provider/provider.dart';

class BiodataPage extends StatefulWidget {
  const BiodataPage({Key? key}) : super(key: key);

  @override
  _BiodataPageState createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  @override
  void initState() {
    context.read<BiodataCubit>().biodataGet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BiodataCubit, BiodataState>(
        builder: (context, state) {
          if (state is BiodataValid) {
            return SafeArea(
              child: ListView(children: [
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockVertical(1),
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
                                  image: AssetImage(
                                      "assets/icons/blueBtnBack.png"))),
                        ),
                      ),
                      Text(
                        "BIODATA",
                        style: darkBlueTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      ),
                      SizedBox(
                        height: 40,
                        width: 40,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.blockVertical(1)),
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundColor: kPrimaryColor,
                    radius: SizeConfig.blockHorizontal(15),
                    child: Icon(
                      Icons.person,
                      color: kWhiteColor,
                      size: SizeConfig.blockVertical(10),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockVertical(2),
                      left: SizeConfig.blockHorizontal(6),
                      right: SizeConfig.blockHorizontal(6),
                      bottom: SizeConfig.blockVertical(2)),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(defaultRadius)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "BIODATA",
                        style: blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                            letterSpacing: 1),
                      ),
                      CostumeBiodataTile(
                          itemName: "Name",
                          itemDetails: "${state.biodataModel.biodata?.nama}",
                          color: kBlackColor),
                      CostumeBiodataTile(
                          itemName: "NIM",
                          itemDetails: "${state.biodataModel.biodata?.nim}",
                          color: kBlackColor),
                      CostumeBiodataTile(
                          itemName: "PRODI",
                          itemDetails:
                              "${state.biodataModel.biodata?.namaProdi}",
                          color: kBlackColor),
                      CostumeBiodataTile(
                          itemName: "Angkatan",
                          itemDetails:
                              "${state.biodataModel.biodata?.angkatan}",
                          color: kBlackColor),
                      CostumeBiodataTile(
                          itemName: "Tempat/Tanggal Lahir",
                          itemDetails:
                              "${state.biodataModel.biodata?.tempatLahir} / ${state.biodataModel.biodata?.tanggalLahir}",
                          color: kBlackColor),
                      CostumeBiodataTile(
                          itemName: "Email",
                          itemDetails:
                              "${state.biodataModel.biodata?.email?.toLowerCase()}",
                          color: kBlackColor),
                      CostumeBiodataTile(
                          itemName: "Ponsel",
                          itemDetails: "${state.biodataModel.biodata?.ponsel}",
                          color: kBlackColor),
                      CostumeBiodataTile(
                          itemName: "Dosen Wali",
                          itemDetails:
                              "${state.biodataModel.biodata?.namaDosenwali}",
                          color: kBlackColor),
                      CostumeBiodataTile(
                          itemName: "Alamat",
                          itemDetails: "${state.biodataModel.biodata?.alamat}",
                          color: kBlackColor),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 24, right: 24),
                  child: CostumeButton(
                    buttonName: Text(
                      "Update Biodata",
                      style: whiteTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    width: 80,
                    height: 50,
                    color: kPrimaryColor,
                    onPressed: () {},
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 24, right: 24),
                  child: CostumeButton(
                    buttonName: Text(
                      "Update Password Microsoft",
                      style: whiteTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    width: 80,
                    height: 50,
                    color: kPrimaryColor,
                    onPressed: () {},
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 20, left: 24, right: 24, bottom: 40),
                  child: CostumeButton(
                    buttonName: Text(
                      "Update Biodata Dikti",
                      style: whiteTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    width: 80,
                    height: 50,
                    color: kPrimaryColor,
                    onPressed: () {},
                  ),
                ),
              ]),
            );
          }
          if (state is BiodataLoading) {
            return Center(
              child: SpinKitCircle(
                color: kPrimaryColor,
              ),
            );
          }
          if (state is BiodataInvalid) {
            return Center(
              child: Text("${state.errorMessage}"),
            );
          }

          return Center(
            child: SpinKitCircle(
              color: kPrimaryColor,
            ),
          );
        },
      ),
    );
  }
}
