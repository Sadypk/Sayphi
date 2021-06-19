import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';

class ChatHeader extends StatelessWidget {
  final String image;
  const ChatHeader({
    Key? key,
    required this.image
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.PRIMARY, width: .5),
            shape: BoxShape.circle,
            image: DecorationImage(
              image: CachedNetworkImageProvider(image),
              fit: BoxFit.cover
            )
          ),
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
