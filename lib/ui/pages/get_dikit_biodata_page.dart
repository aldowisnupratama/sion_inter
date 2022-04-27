import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sion_inter/cubit/biodata_dikti/biodata_dikti_cubit.dart';
import 'package:sion_inter/shared/shared.dart';
import 'package:sion_inter/ui/ui.dart';

class GetBiodataPages extends StatefulWidget {
  const GetBiodataPages({Key? key}) : super(key: key);

  @override
  State<GetBiodataPages> createState() => _GetBiodataPagesState();
}

class _GetBiodataPagesState extends State<GetBiodataPages> {
  @override
  void initState() {
    BlocProvider.of<BiodataDiktiCubit>(context).fetchBiodataDikti();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BiodataDiktiCubit, BiodataDiktiState>(
      builder: (context, state) {
        if (state is BiodataDiktiLoad) {
          return Center(
            child: SpinKitFadingCircle(color: kPrimaryColor),
          );
        }
        if (state is BiodataDiktiFail) {
          return Center(
            child: Text("${state.errorMessage}"),
          );
        }
        if (state is BiodataDiktiSuccess) {
          return SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(width: 2, color: kPrimaryColor)),
              margin: EdgeInsets.only(
                  top: SizeConfig.blockVertical(3),
                  left: SizeConfig.blockHorizontal(8),
                  right: SizeConfig.blockHorizontal(8),
                  bottom: SizeConfig.blockVertical(7)),
              padding: EdgeInsets.only(
                  top: SizeConfig.blockVertical(3),
                  left: SizeConfig.blockHorizontal(5),
                  right: SizeConfig.blockHorizontal(5),
                  bottom: SizeConfig.blockVertical(3)),
              child: Column(children: [
                Text(
                  "DIKTI BIODATA",
                  style: blackTextStyle.copyWith(
                      fontSize: 18, fontWeight: semiBold, letterSpacing: 1),
                ),
                CostumeBiodataTile(
                    itemName: "Name",
                    itemDetails: "${state.biodataDikti.nama}",
                    color: kBlackColor),
                CostumeBiodataTile(
                    itemName: "NIK",
                    itemDetails: "${state.biodataDikti.nik}",
                    color: kBlackColor),
                CostumeBiodataTile(
                    itemName: "NIM",
                    itemDetails: "${state.biodataDikti.nim}",
                    color: kBlackColor),
                CostumeBiodataTile(
                    itemName: "Phone Number",
                    itemDetails: "${state.biodataDikti.ponsel}",
                    color: kBlackColor),
                CostumeBiodataTile(
                    itemName: "Mother's Name",
                    itemDetails: "${state.biodataDikti.orangtua}",
                    color: kBlackColor),
                CostumeBiodataTile(
                    itemName: "Address",
                    itemDetails: "${state.biodataDikti.alamat}",
                    color: kBlackColor),
                CostumeBiodataTile(
                    itemName: "Province",
                    itemDetails: "${state.biodataDikti.provinsi}",
                    color: kBlackColor),
                CostumeBiodataTile(
                    itemName: "District",
                    itemDetails: "${state.biodataDikti.kabupaten}",
                    color: kBlackColor),
                CostumeBiodataTile(
                    itemName: "Subdistrict",
                    itemDetails: "${state.biodataDikti.kecamatan}",
                    color: kBlackColor),
                CostumeBiodataTile(
                    itemName: "Village",
                    itemDetails: "${state.biodataDikti.kelurahan}",
                    color: kBlackColor),
              ]),
            ),
          );
        }
        return SingleChildScrollView(
          child: Column(children: []),
        );
      },
    );
  }
}
