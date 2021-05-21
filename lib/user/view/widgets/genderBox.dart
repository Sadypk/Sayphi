import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';

class GenderBox extends StatelessWidget {
  final String label;
  final bool isSelected;

  const GenderBox({Key? key, required this.label, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          color: isSelected ? AppColor.PRIMARY : Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isSelected ? AppColor.PRIMARY : AppColor.BORDER_COLOR,
          )
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
              fontSize: 18,
              fontFamily: CFontFamily.REGULAR,
              color: isSelected ? Colors.white : AppColor.TEXT_COLOR
          ),
        ),
      ),
    );
  }
}