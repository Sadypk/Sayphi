import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';

class SendGiftBottomSheet extends StatelessWidget {
  const SendGiftBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .3,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              indicatorWeight: 4,
              indicatorColor: AppColor.PRIMARY,
              labelColor: AppColor.TEXT_COLOR,
              labelStyle: TextStyle(
                fontSize: 16,
                fontFamily: CFontFamily.MEDIUM
              ),
              tabs: [
                Tab(text: 'Popular'),
                Tab(text: 'Excluesive'),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: TabBarView(
                  children: [
                    GiftGrid(),
                    GiftGrid(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GiftGrid extends StatelessWidget {
  const GiftGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: 50,
      itemBuilder: (_, index) => GiftItem(),
    );
  }
}

class GiftItem extends StatelessWidget {
  const GiftItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .1,
      padding: EdgeInsets.all(4),
      child: Column(
        children: [
          Expanded(
            flex: 75,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    'https://cdn.dribbble.com/users/3687898/screenshots/14231035/media/19a377c1c5405e6d460d3774a1c81fa6.gif'
                  )
                )
              ),
            ),
          ),
          Expanded(
            flex: 25,
            child: Center(
              child: Text(
                '120P',
              ),
            )
          ),
        ],
      ),
    );
  }
}
