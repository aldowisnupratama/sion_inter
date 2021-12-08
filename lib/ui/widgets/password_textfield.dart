import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../shared/shared.dart';

class CostumePasswordField extends StatefulWidget {
  final String textformfieldName;
  final String hintText;
  bool obsecureText;

  final TextEditingController controller;
  CostumePasswordField(
      {Key? key,
      required this.textformfieldName,
      this.hintText = "",
      this.obsecureText = true,
      required this.controller})
      : super(key: key);

  @override
  _CostumePasswordFieldState createState() => _CostumePasswordFieldState();
}

class _CostumePasswordFieldState extends State<CostumePasswordField> {
  FocusNode passwordNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          widget.textformfieldName,
          style:
              blackTextStyle.copyWith(fontWeight: semiBold, letterSpacing: 1),
        ),
        SizedBox(height: 6),
        TextFormField(
          controller: widget.controller,
          cursorColor: Colors.blue[900],
          obscureText: widget.obsecureText,
          keyboardType: TextInputType.text,
          inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
          decoration: InputDecoration(
              hintText: widget.hintText,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(18)),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    widget.obsecureText = !widget.obsecureText;
                  });
                },
                icon: Icon(
                  (widget.obsecureText)
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color:
                      (passwordNode.hasFocus) ? kPrimaryColor : kPrimaryColor,
                ),
              )),
        )
      ]),
    );
  }
}
