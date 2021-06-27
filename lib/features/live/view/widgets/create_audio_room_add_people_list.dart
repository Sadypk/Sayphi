import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/demo_files.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/features/chat_messaging/view/widgets/chat_head.dart';

RxList<String> selectedUsers = <String>[].obs;

class AddPeople extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        primary: false,
        padding: EdgeInsets.only(bottom: Get.height * .1),
        shrinkWrap: true,
        itemCount: Demo.DEMO_USERS.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (_, index) => AudioRoomUser(user: Demo.DEMO_USERS[index]),
      )
    );
  }
}

class AudioRoomUser extends StatelessWidget {

  final String user;

  const AudioRoomUser({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Obx((){
      final _isActive = selectedUsers.contains(user);
      return GestureDetector(
        onTap: (){
          if(_isActive){
            selectedUsers.remove(user);
          }else{
            selectedUsers.add(user);
          }

        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent,width: 0)
          ),
          margin: EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    height: 60,
                    child: ChatHeader(image: user),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Arya Stark, 18',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                        width: 215,
                        child: Text(
                          'Winterfell',
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
                  child: Icon(
                    _isActive ? Icons.check_circle : Icons.cancel,
                    color: _isActive ? AppColor.PRIMARY : AppColor.DARK_GREY,
                  )
              )
            ],
          ),
        ),
      );
    });
  }
}

