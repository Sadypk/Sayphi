import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';

class ChatHeader extends StatelessWidget {
  const ChatHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 60,
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.PRIMARY, width: .5),
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage('assets/images/couple_heart.png'))),
        ),
        Positioned(
          top: 5,
          right: 10,
          child: Container(width: 15, height: 15, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green)),
        ),
      ],
    );
  }
}
