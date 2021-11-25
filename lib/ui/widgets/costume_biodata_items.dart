import 'package:flutter/material.dart';
import '../../shared/shared.dart';

class CostumeBiodataTile extends StatelessWidget {
  final String itemName, itemDetails;
  final Color color;
  const CostumeBiodataTile(
      {Key? key,
      required this.itemName,
      required this.itemDetails,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            margin: EdgeInsets.only(right: SizeConfig.blockHorizontal(2.4)),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/icons/yellowCheckedCircle.png"))),
          ),
          Expanded(
              child: Text(
            "$itemName",
            style: blackTextStyle.copyWith(fontWeight: medium),
          )),
          // Flexible(
          //   child: Text(
          //     "$itemDetails",
          //     style: blackTextStyle.copyWith(
          //       fontWeight: medium,
          //       color: color,
          //     ),
          //   ),
          // ),
          Flexible(
            child: Text(
              "$itemDetails",
              style: blackTextStyle.copyWith(
                fontWeight: medium,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
