import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';

import '../resources/appColor.dart';

class MainButton extends StatelessWidget {
  final String label;
  final VoidCallback onPress;
  final Color? btnColor;
  final Color? labelColor;
  final IconData? trailingIcon;
  final IconData? leadingIcon;
  final TextStyle? textStyle;
  final String? assetLeadingIcon;
  const MainButton({Key? key,
    required this.onPress,
    required this.label,
    this.btnColor,
    this.labelColor,
    this.trailingIcon,
    this.leadingIcon,
    this.textStyle,
    this.assetLeadingIcon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: btnColor ?? AppColor.PRIMARY,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              offset: Offset(0,8),
              blurRadius: 14,
              color: AppColor.PRIMARY.withOpacity(.15)
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(assetLeadingIcon!=null)Row(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  child: Image.asset('$assetLeadingIcon', fit: BoxFit.cover,),
                ),
                SizedBox(width: 8,)
              ],
            ),
            if(leadingIcon != null) Row(
              children: [
                Icon(
                  leadingIcon,
                  color: Colors.white,
                ),
                SizedBox(width: 8),
              ],
            ),
            Text(
              label,
              style: textStyle!=null?textStyle:TextStyle(
                fontSize: 22,
                fontFamily: CFontFamily.REGULAR,
                color: labelColor == null ? btnColor == null ? Colors.white : AppColor.PRIMARY : labelColor
              ),
            ),
            if(trailingIcon != null) Row(
              children: [
                SizedBox(width: 8),
                Icon(
                  trailingIcon,
                  color: Colors.green,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
