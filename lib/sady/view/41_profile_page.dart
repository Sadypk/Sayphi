import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/appImages.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/sady/view/42_profile_page_edit_info.dart';
import 'package:sayphi/sady/view/46_settings_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    detailSection(String title, String detail){
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text(detail, style: TextStyle(fontSize: 14),)
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColor.SCAFFOLD_BG_PINK,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.settings, color: AppColor.DARK_GREY,), onPressed: (){Get.to(SettingsPage());},),
        actions: [
          IconButton(onPressed: (){
            Get.to(ProfilePageEditInfo());
          }, icon: Icon(Icons.person, color: AppColor.DARK_GREY,)),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 10,),

          //Profile picture & card
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 477,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  image: DecorationImage(image: NetworkImage('https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'), fit: BoxFit.cover),
                ),
              ),
              Positioned(
                bottom: -50,
                right: 0,
                left: 0,
                child: Container(
                  height: 100,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0,0.8),
                        spreadRadius: 0.5,
                        blurRadius: 1,
                        color: Colors.grey.withOpacity(0.5)
                      )
                    ]
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Katerina Aleria, 25', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                            SizedBox(height: 5,),
                            Text('Baku, Azerbaijan', style: TextStyle(fontSize: 14),)
                          ],
                        ),
                        Stack(
                          children: [
                            Image.asset(
                              Images.ICON_HEXAGON,
                              height: 54,
                              width: 48,
                            ),
                            Positioned.fill(
                              child: Center(
                                child: Text(
                                  '82',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: CFontFamily.MEDIUM
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ))
            ],
          ),

          SizedBox(height: 70,),

          //Occupation
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.briefcase, color: AppColor.PRIMARY,  size: 14,),
                SizedBox(width: 7,),
                Text('Fashion model at Myntra', style: TextStyle(fontSize: 14),)
              ],
            ),
          ),
          SizedBox(height: 10,),

          //Education
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.graduationCap, color: AppColor.PRIMARY,  size: 14,),
                SizedBox(width: 7,),
                Text('Studied at University of Dhaka', style: TextStyle(fontSize: 14),)
              ],
            ),
          ),

          SizedBox(height: 30,),

          //Add a prompt card
          Container(
            height: 190,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.my_library_add_rounded, color: AppColor.DARK_GREY,),
                SizedBox(height: 10,),
                Text('Specify your profiles to get more dates', style: TextStyle(fontSize: 16),),
                SizedBox(height: 20,),
                Container(
                  height: 50,
                  width: 155,
                  decoration: BoxDecoration(
                    color: AppColor.PRIMARY,
                    borderRadius: BorderRadius.circular(6)
                  ),
                  child: Center(
                    child: Text('Add a prompt', style: TextStyle(color: Colors.white, fontSize: 18),),
                  ),
                )
              ],
            ),
          ),

          //Height
          SizedBox(height: 30,),
          detailSection('Height', '168 cm'),

          //Education
          SizedBox(height: 20,),
          detailSection('Education', 'Masters'),

          //Religion
          SizedBox(height: 20,),
          detailSection('Religion', 'Muslim'),

          //Ethnicity
          SizedBox(height: 20,),
          detailSection('Ethnicity', 'Asian'),

          //Relationship goals
          SizedBox(height: 20,),
          detailSection('Relationship goals', 'Prefer not to say'),
          SizedBox(height: 30,),
        ],
      ),
    );
  }
}
