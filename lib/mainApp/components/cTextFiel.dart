import 'package:flutter/material.dart';

class CTextField extends StatelessWidget {
  final String? hintText;
  const CTextField({Key? key,
    this.hintText

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color(0xffF1F1F1),
            borderRadius: BorderRadius.circular(6)
        ),
        child: TextField(
          decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.only(left: 12)
          ),
        )
    );
  }
}
