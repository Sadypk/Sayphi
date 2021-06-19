import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/demo_files.dart';
import 'package:sayphi/features/chat_menu/view_model/chat_head.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';

class ChattingScreen extends StatefulWidget {
  const ChattingScreen({Key? key}) : super(key: key);

  @override
  _ChattingScreenState createState() => _ChattingScreenState();
}

class _ChattingScreenState extends State<ChattingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .7,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(Demo.PROFILE_IMAGE),
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        )
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.TEXT_COLOR.withOpacity(.8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                )
              ),
            ),
          ),

          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8,left: 8),
                    child: ChatHeader(image: Demo.PROFILE_IMAGE),
                  ),
                  CloseButton(
                    color: Colors.white,
                  )
                ],
              ),

              SizedBox(height: 12),
              Text(
                'user_name is ready to chat',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: CFontFamily.REGULAR
                ),
              ),
              Spacer(),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                child: SizedBox(
                  height: 55,
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Enter Message',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      suffixIcon: GestureDetector(
                        onTap: (){
                          
                        },
                        child: Icon(
                          CupertinoIcons.gift_fill,
                          color: AppColor.PRIMARY,
                        ),
                      )
                    ),
                  ),
                ),
              )
            ],
          )
        ]
      )
    );
  }
}
