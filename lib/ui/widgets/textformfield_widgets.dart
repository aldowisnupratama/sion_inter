import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../shared/shared.dart';

class CostumeTextFormField extends StatelessWidget {
  final String textformfieldName;
  final String hintText;
  final bool obsecureText;
  final bool nimTextFormField;
  final TextEditingController controller;
  const CostumeTextFormField(
      {Key? key,
      required this.textformfieldName,
      this.hintText = "",
      this.obsecureText = false,
      this.nimTextFormField = false,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          textformfieldName,
          style:
              blackTextStyle.copyWith(fontWeight: semiBold, letterSpacing: 1),
        ),
        SizedBox(height: 6),
        TextFormField(
          controller: controller,
          cursorColor: Colors.blue[900],
          obscureText: obsecureText,
          keyboardType: (nimTextFormField)
              ? TextInputType.numberWithOptions(decimal: true)
              : TextInputType.text,
          inputFormatters: [
            (nimTextFormField)
                ? FilteringTextInputFormatter.digitsOnly
                : FilteringTextInputFormatter.singleLineFormatter
          ],
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(18)),
          ),
        )
      ]),
    );
  }
}
