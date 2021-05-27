import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitDualRing(
        color: AppColor.PRIMARY,
        lineWidth: 4,
      ),
    );
  }
}
