import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/model/otherUserModel.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:get/get.dart';

class ChatHead extends StatelessWidget {
  final OtherUserModel user;
  ChatHead({required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColor.PRIMARY, width: 1),
              image: DecorationImage(
                  image: CachedNetworkImageProvider(user.image),
                  fit: BoxFit.cover
              )
          )
        ),
        SizedBox(height: 4),
        Text('${user.name.trim().capitalize!}', style: TextStyle(fontSize: 14, color: AppColor.TEXT_COLOR),)
      ],
    );
  }
}
