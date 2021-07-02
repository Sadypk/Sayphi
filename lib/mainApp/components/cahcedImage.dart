import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';


class CImage extends StatelessWidget {
  final String link;

  final double? height;
  final double? width;

  const CImage(this.link,{this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: link,
      fit: BoxFit.cover,
      height: height,
      width: width,
      errorWidget: (_, __, ___) => Center(
        child: Icon(
          Icons.broken_image_rounded,
          color: AppColor.PRIMARY_DARK,
          size: 30,
        ),
      ),
      placeholder: (_, __) => Center(child: SpinKitCubeGrid(color: AppColor.PRIMARY)),
    );
  }
}