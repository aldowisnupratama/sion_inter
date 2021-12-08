import 'package:flutter/material.dart';
import 'package:sion_inter/model/model.dart';
import 'package:sion_inter/shared/shared.dart';

class CostumeFinalTestCard extends StatelessWidget {
  final Uas uas;
  const CostumeFinalTestCard({Key? key, required this.uas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18), color: kWhiteColor),
      margin: EdgeInsets.only(
        top: SizeConfig.blockVertical(2),
        right: SizeConfig.blockHorizontal(5),
        left: SizeConfig.blockHorizontal(5),
      ),
      padding: EdgeInsets.only(
          left: SizeConfig.blockHorizontal(5),
          right: SizeConfig.blockHorizontal(5),
          top: SizeConfig.blockVertical(3),
          bottom: SizeConfig.blockVertical(3)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Container(
              width: SizeConfig.blockHorizontal(15),
              height: SizeConfig.blockVertical(8),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/icons/note_icon.png"))),
            ),
            title: Text(
              uas.namaMatakuliah!,
              style:
                  blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
            ),
            subtitle: Text(
              "${uas.jam}",
              style:
                  blackTextStyle.copyWith(fontSize: 10, fontWeight: semiBold),
            ),
          ),
          Container(
            child: Text(
              "Test Details",
              style:
                  blackTextStyle.copyWith(fontSize: 15, fontWeight: semiBold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: SizeConfig.blockVertical(1)),
            child: Row(
              children: [
                Container(
                  width: SizeConfig.blockHorizontal(5),
                  height: SizeConfig.blockVertical(2.4),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/icons/dot_icon.png"))),
                ),
                Container(
                  margin: EdgeInsets.only(left: SizeConfig.blockHorizontal(5)),
                  child: Text(
                    "${uas.hari}, ${uas.tanggalUjian}",
                    style: blackTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: SizeConfig.blockVertical(1)),
            child: Row(
              children: [
                Container(
                  width: SizeConfig.blockHorizontal(5),
                  height: SizeConfig.blockVertical(2.4),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/icons/dot_icon.png"))),
                ),
                Container(
                  margin: EdgeInsets.only(left: SizeConfig.blockHorizontal(5)),
                  child: Text(
                    "Class Code : ${uas.kodeKelas}",
                    style: blackTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: SizeConfig.blockVertical(1)),
            child: Row(
              children: [
                Container(
                  width: SizeConfig.blockHorizontal(5),
                  height: SizeConfig.blockVertical(2.4),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/icons/dot_icon.png"))),
                ),
                Container(
                  margin: EdgeInsets.only(left: SizeConfig.blockHorizontal(5)),
                  child: Text(
                    "Class Name : ${uas.namaKelas}",
                    style: blackTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: SizeConfig.blockVertical(1)),
            child: Row(
              children: [
                Container(
                  width: SizeConfig.blockHorizontal(5),
                  height: SizeConfig.blockVertical(2.4),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/icons/dot_icon.png"))),
                ),
                Container(
                  margin: EdgeInsets.only(left: SizeConfig.blockHorizontal(5)),
                  child: Text(
                    "Classroom : ${uas.ruangan}",
                    style: blackTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
