import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sayphi/demo_files.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/appImages.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/user/view/42_profile_page_edit_info.dart';
import 'package:sayphi/user/view/46_settings_page.dart';
import 'package:sayphi/user/view_model/userViewModel.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {

    _buildDetailSection(String title, String detail){
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

    return Obx((){
      final _user = UserViewModel.user.value;
      return Scaffold(
        backgroundColor: AppColor.SCAFFOLD_BG_PINK,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Profile',
            style: TextStyle(
              fontFamily: CFontFamily.MEDIUM,
              color: AppColor.TEXT_COLOR
            ),
          ),
          leading: IconButton(
            onPressed: (){
              Get.to(()=>SettingsPage());
            },
            icon: Icon(Icons.settings, color: AppColor.DARK_GREY,),

          ),
          actions: [
            IconButton(
              onPressed: (){
                Get.to(()=>ProfilePageEditInfo()
              );
            },
              icon: Icon(Icons.person_remove_alt_1_rounded, color: AppColor.DARK_GREY,)),
          ],
        ),
        body: ListView(
          children: [
            SizedBox(height: 10,),

            /// Profile picture & card
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: Get.height * .6,
                  margin: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        _user.profileImage == null || _user.profileImage == '' ? Demo.PROFILE_IMAGE : _user.profileImage!
                      ),
                      fit: BoxFit.cover
                    ),
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
                                Text(
                                  _user.name ?? 'None_Given',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                SizedBox(height: 5,),
                                Text(
                                  _user.filters.location!.name!,
                                  style: TextStyle(fontSize: 14),
                                )
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
                  InkWell(
                    borderRadius: BorderRadius.circular(6),
                    onTap: (){
                      Get.to(()=>ProfilePageEditInfo(tab: 2));
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

            //Height
            SizedBox(height: 30,),
            _buildDetailSection('Height', '${_user.height ?? 'None specified' } ${_user.height == null ? '' : ' cm'}'),

            //Education
            Wrap(
              children: _user.qa.map((e) => Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,width: double.infinity),
                  _buildDetailSection(e.qa.question, e.answer),
                ],
              )).toList(),
            ),
            SizedBox(height: 30,),
          ],
        ),
      );
    });
  }
}
