import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/features/chat_menu/view_model/chat_head.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';

class AddPeople extends StatelessWidget {
  final RxBool selected = false.obs;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: ListView.builder(
        primary: false,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.vertical,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: (){
              selected.value = !selected.value;
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
                        child: ChatHeader(),
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
                    child: Obx(()=>Icon(selected.value?Icons.check_circle:Icons.clear_rounded,color: selected.value?AppColor.PRIMARY:AppColor.DARK_GREY,)),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
