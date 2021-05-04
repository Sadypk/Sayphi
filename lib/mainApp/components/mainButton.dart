import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';

class MainButton extends StatelessWidget {
  final String label;
  const MainButton({Key? key,required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: AppColor.PRIMARY,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: Offset(0,8),
            blurRadius: 14,
            color: AppColor.PRIMARY.withOpacity(.15)
          )
        ]
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 22,
            fontFamily: FontStyle.FONT_REGULAR,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
