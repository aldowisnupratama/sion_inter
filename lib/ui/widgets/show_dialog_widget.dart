import 'package:flutter/material.dart';
import 'package:sion_inter/shared/shared.dart';

class ShowDialogWidget {
  static Widget dialogWidget(IconData dialogIcon, Color dialogColor,
      String dialogContent, Widget dialogAction) {
    return AlertDialog(
      title: Icon(
        dialogIcon,
        color: dialogColor,
        size: SizeConfig.blockVertical(10),
      ),
      content: Text(
        dialogContent,
        textAlign: TextAlign.center,
      ),
      actions: [dialogAction],
    );
  }
}
