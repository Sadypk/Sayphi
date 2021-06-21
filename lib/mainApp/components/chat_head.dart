import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';

class ChatHead extends StatelessWidget {
  ChatHead(this.isOnline, this.image, this.name, this.age, {this.size = 90});
  final String image;
  final String name;
  final int age;
  final bool isOnline;
  final double size;
  // ChatHead({@required this.image, @required this.isOnline});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColor.PRIMARY, width: 1),
              image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover
              )
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment:MainAxisAlignment.end,
            children: [
              if(isOnline)Container(
                height: size/5,
                width: size/5,
                margin: EdgeInsets.only(top: 4, right: 4),
                decoration: BoxDecoration(
                    color: Color(0xff0FDF0F),
                    shape: BoxShape.circle
                ),
              )
            ],
          ),
        ),
        Text('$name, $age', style: TextStyle(fontSize: 14, color: AppColor.TEXT_COLOR),)
      ],
    );
  }
}
