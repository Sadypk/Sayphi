import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';

class PrimaryColorButton extends StatefulWidget {
  // final double height;
  // final double width;
  final String label;
  final IconData iconData;

  PrimaryColorButton({
    required this.iconData,
    required this.label,
    // required this.width,
    // required this.height
  });

  @override
  _PrimaryColorButtonState createState() => _PrimaryColorButtonState();
}

class _PrimaryColorButtonState extends State<PrimaryColorButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      // margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColor.PRIMARY,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(widget.iconData, size: 18, color: Colors.white,),
          SizedBox(width: 5,),
          Text(widget.label, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),)
        ],
      ),
    );
  }
}
