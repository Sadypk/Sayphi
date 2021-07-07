import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';

class CTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  final bool hideText;
  const CTextField({Key? key,
    this.hintText,
    this.hideText = false,
    required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: hideText,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        contentPadding: EdgeInsets.only(left: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: AppColor.BORDER_COLOR
          )
        )
      ),
    );
  }
}
