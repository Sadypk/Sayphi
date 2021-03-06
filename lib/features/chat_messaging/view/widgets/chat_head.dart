import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sayphi/features/homeScreen/model/matchedUserModel.dart';
import 'package:sayphi/mainApp/model/otherUserModel.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';

class ChatHeader extends StatelessWidget {
  final OtherUserModel? user;
  final MinimalUserModel? minUser;
  final String? image;
  final bool isActive;
  const ChatHeader({
    Key? key,
    this.user,
    this.image,
    this.minUser,
    this.isActive = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String? imageLink;

    if(user != null) imageLink = user!.image;
    if(minUser != null) imageLink = minUser!.image;
    if(image != null) imageLink = image!;

    return Stack(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.PRIMARY, width: 1),
            shape: BoxShape.circle,
            image: DecorationImage(
              image: CachedNetworkImageProvider(imageLink!),
              fit: BoxFit.cover
            )
          ),
        ),
        if(isActive)Positioned(
          top: 5,
          right: 10,
          child: Container(width: 15, height: 15, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green)),
        ),
      ],
    );
  }
}
