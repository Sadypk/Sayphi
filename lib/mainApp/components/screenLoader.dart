import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:sayphi/mainApp/config/graphql/apiConfig.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';


class ScreenLoader extends StatelessWidget {
  final Widget child;
  final bool? loader;
  const ScreenLoader({Key? key, required this.child, this.loader}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(loader != null){
      return GestureDetector(
        onTap: ()=> FocusScope.of(context).unfocus(),
        child: LoadingOverlay(
          isLoading: loader!,
          progressIndicator: SpinKitDualRing(
              color: AppColor.PRIMARY
          ),
          color: AppColor.DARK_GREY.withOpacity(.45),
          child: WillPopScope(
              onWillPop: () async => loader! ? false : true,
              child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overScroll) {
                    overScroll.disallowGlow();
                    return false;
                  },
                  child: child)
          ),
        ),
      );
    }else{
      return GestureDetector(
        onTap: ()=> FocusScope.of(context).unfocus(),
        child: Obx(()=>LoadingOverlay(
          isLoading: Api.apiLoading.value,
          progressIndicator: SpinKitDualRing(
              color: AppColor.PRIMARY
          ),
          color: AppColor.DARK_GREY.withOpacity(.45),
          child: WillPopScope(
              onWillPop: () async => Api.apiLoading.value ? false : true,
              child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overScroll) {
                    overScroll.disallowGlow();
                    return false;
                  },
                  child: child)
          ),
        )),
      );
    }
  }
}
