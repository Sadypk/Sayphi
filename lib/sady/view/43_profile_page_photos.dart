import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/mainApp/components/loader.dart';
import 'package:sayphi/mainApp/config/firebase/fStorage.dart';
import 'package:sayphi/mainApp/helpers/imageHelper.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/user/model/userModel.dart';
import 'package:sayphi/user/repository/userRepo.dart';
import 'package:sayphi/user/view_model/userViewModel.dart';

class ProfilePagePhotos extends StatefulWidget {
  @override
  _ProfilePagePhotosState createState() => _ProfilePagePhotosState();
}

class _ProfilePagePhotosState extends State<ProfilePagePhotos> {

  @override
  Widget build(BuildContext context) {
    return Obx((){

      final _user = UserViewModel.user.value;

      previewCard(String? image, bool isVideo){

        final isSelected = image == null || image == '';
        bool loading = false;

        return Stack(
          children: [
            StatefulBuilder(builder: (BuildContext context, void Function(void Function()) _setState) {

              return GestureDetector(
                onTap: () async{
                  File? image = await ImageHelper.selectPic();
                  if(image != null){
                    _setState((){loading = true;});
                    final link = await FireStorage.storeFile(image);
                    if(_user.profileImage == null || _user.profileImage == ''){
                      await UserRepo.updateProfile(profileImage: link);
                    }else{
                      await UserRepo.addImage(link);
                    }
                    _setState((){loading = false;});

                  }
                },
                child: Container(
                  height: Get.height * .19,
                  width: Get.height * .135,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: !isSelected?Colors.transparent:AppColor.LIGHT_GREY,
                      border: Border.all(color: !isSelected?Colors.transparent:Colors.grey),
                      image: !isSelected?DecorationImage(
                          image: CachedNetworkImageProvider(image!),
                          fit: BoxFit.cover
                      ):null
                  ),
                  child: loading ? Loader() : !isSelected?null:Center(
                    child: Icon(isVideo?Icons.videocam:Icons.camera_alt_rounded, color: Color(0xffA1A1A1), size: 30,),
                  )
                  ,
                ),
              );

            }),
            if(isSelected)Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.PRIMARY
                  ),
                  child: Center(
                    child: Icon(Icons.add, color: Colors.white, size: 16,),
                  ),
                ))
          ],
        );
      }

      return ListView(
        children: [
          //Add photos
          Text('Add photos', style: TextStyle(fontSize: 16),),
          SizedBox(height: 10,),
          Text('Add photos so people know you better', style: TextStyle(fontSize: 14),),
          SizedBox(height: 10,),
          _user.images.length > 0 ? Wrap(
            spacing: 12,
            runSpacing: 12,
            crossAxisAlignment: WrapCrossAlignment.start,
            runAlignment: WrapAlignment.start,
            children: [
              previewCard(_user.profileImage, false),

              for (ImageModel e in _user.images)
                previewCard(e.image, false),

              previewCard('', false)
            ],
          ) : SizedBox(
            height: 130,
            child: Row(
              children: [
                _user.profileImage == null || _user.profileImage == '' ? SizedBox() : previewCard(_user.profileImage!, false),
                SizedBox(width: _user.profileImage == null ? 0 : 15),
                previewCard('', false),
              ],
            ),
          ),
          SizedBox(height: 10,),

          SizedBox(height: 30,),


          //Add videos
          Text('Add videos', style: TextStyle(fontSize: 16),),
          SizedBox(height: 10,),
          Text('Add video into profile to get credit ', style: TextStyle(fontSize: 14),),
/*
          SizedBox(height: 10,),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              previewCard('', true),
              SizedBox(width: 15,),
              previewCard('', true),
              SizedBox(width: 15,),
              previewCard('', true),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              previewCard('',  true),
              SizedBox(width: 15,),
              previewCard('', true),
              SizedBox(width: 15,),
              previewCard('', true),
            ],
          ),
*/


          SizedBox(height: 30,)
        ],
      );
    });
  }
}
