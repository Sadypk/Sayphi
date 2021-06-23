import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/sady/view/45_profile_page_add_prompt_list.dart';

class ProfilePageAddPrompt extends StatefulWidget {
  @override
  _ProfilePageAddPromptState createState() => _ProfilePageAddPromptState();
}

class _ProfilePageAddPromptState extends State<ProfilePageAddPrompt> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),


        //Add a prompt card
        Container(
          height: 190,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.my_library_add_rounded, color: AppColor.DARK_GREY, size: 30,),
              SizedBox(height: 10,),
              Text('Specify your profiles to get more dates', style: TextStyle(fontSize: 16),),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  Get.to(()=>ProfilePageAddPromptList());
                },
                child: Container(
                  height: 50,
                  width: 155,
                  decoration: BoxDecoration(
                      color: AppColor.PRIMARY,
                      borderRadius: BorderRadius.circular(6)
                  ),
                  child: Center(
                    child: Text('Add a prompt', style: TextStyle(color: Colors.white, fontSize: 18),),
                  ),
                ),
              )
            ],
          ),
        ),


        SizedBox(height: 25,),


        //prompt list I guess
        Container(
          height: 80,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColor.TEXT_LIGHT, width: 0.5),
            borderRadius: BorderRadius.circular(5)
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('A book everyone should read', style: TextStyle(color: AppColor.PRIMARY, fontSize: 16),),
                  Text('Sherlock Holmes', style: TextStyle(fontSize: 16),)
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.edit, size: 15, color: Color(0xff666666),),
                  SizedBox(width: 7,),
                  Icon(Icons.delete, size: 20, color: AppColor.PRIMARY,),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
