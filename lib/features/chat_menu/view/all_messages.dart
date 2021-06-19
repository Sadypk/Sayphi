import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/demo_files.dart';
import 'package:sayphi/features/chat_menu/view_model/chat_head.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';

class AllMessages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: 10,
        scrollDirection: Axis.vertical,
        itemBuilder: (_, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 60,
                      child: ChatHeader(image: Demo.DEMO_USERS[1]),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Arya Stark',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Container(
                          width: 215,
                          child: Text(
                            'Fear cuts deeper than swords..',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  width: 35,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '18:31',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Stack(
                        children: [
                          Positioned(
                            top: -1,
                            right: 4,
                            child: Icon(
                              Icons.check,
                              color: AppColor.PRIMARY,
                            ),
                          ),
                          Icon(
                            Icons.check,
                            color: AppColor.PRIMARY,
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
