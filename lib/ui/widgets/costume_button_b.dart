import 'package:flutter/material.dart';

class CostumeButtonB extends StatefulWidget {
  final double width;
  final double height;
  final Text buttonName;
  final Color color;
  final bool isEnable;
  final Function() onPressed;

  const CostumeButtonB(
      {Key? key,
      required this.width,
      required this.height,
      required this.buttonName,
      required this.color,
      required this.onPressed,
      required this.isEnable})
      : super(key: key);

  @override
  State<CostumeButtonB> createState() => _CostumeButtonBState();
}

class _CostumeButtonBState extends State<CostumeButtonB> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: widget.isEnable ? widget.color : Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18))),
          onPressed: (widget.isEnable ? widget.onPressed : null),
          child: widget.buttonName),
    );
  }
}
