import 'package:flutter/material.dart';

class CostumeButton extends StatelessWidget {
  final double width;
  final double height;
  final Text buttonName;
  final Color color;
  final Function() onPressed;

  const CostumeButton(
      {Key? key,
      required this.width,
      required this.height,
      required this.buttonName,
      required this.color,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18))),
          onPressed: onPressed,
          child: buttonName),
    );
  }
}
