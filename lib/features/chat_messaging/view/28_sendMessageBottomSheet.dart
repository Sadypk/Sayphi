import 'package:cached_network_image/cached_network_image.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/features/chat_messaging/repository/chatRepo.dart';
import 'package:sayphi/features/gift/view/29_send_gift_bottom_sheet.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/appConst.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/user/model/userModel.dart';

class ChattingScreen extends StatefulWidget {
  final UserModel user;
  const ChattingScreen({Key? key, required this.user}) : super(key: key);

  @override
  _ChattingScreenState createState() => _ChattingScreenState();
}

class _ChattingScreenState extends State<ChattingScreen> {

  bool _isSendGiftSheetOpen = false;

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _isSendGiftSheetOpen ? Get.height * .9 : Get.height * .6,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(widget.user.profileImage!),
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
                    // child: ChatHeader(image: Demo.PROFILE_IMAGE),
                  ),
                  CloseButton(
                    color: Colors.white,
                  )
                ],
              ),

              SizedBox(height: 12),
              Text(
                '${widget.user.name} is ready to chat',
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
                  height: 50,
                  child: TextField(
                    controller: _controller,
                    onSubmitted: (message){
                      ChatRepo.sendMessage(message, ChatUser(
                        uid: widget.user.id,
                        name: widget.user.name,
                        avatar: widget.user.profileImage
                      ));
                      _controller.clear();
                    },
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
                          setState(() {
                            _isSendGiftSheetOpen = !_isSendGiftSheetOpen;
                          });
                          FocusScope.of(context).unfocus();
                        },
                        child: Icon(
                          CupertinoIcons.gift_fill,
                          color: AppColor.PRIMARY,
                        ),
                      )
                    ),
                  ),
                ),
              ),

              AnimatedCrossFade(
                firstChild: SendGiftBottomSheet(),
                secondChild: SizedBox(),
                duration: AppConst.DURATION_FAST,
                crossFadeState: _isSendGiftSheetOpen ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              )
            ],
          )
        ]
      )
    );
  }
}
