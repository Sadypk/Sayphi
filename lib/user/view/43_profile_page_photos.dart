import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sayphi/mainApp/components/loader.dart';
import 'package:sayphi/mainApp/config/firebase/fStorage.dart';
import 'package:sayphi/mainApp/helpers/imageHelper.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/user/model/userModel.dart';
import 'package:sayphi/user/repository/userRepo.dart';
import 'package:sayphi/user/view_model/userViewModel.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

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
                    final link = await FStorage.storeFile(image);
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
          Text('Add video', style: TextStyle(fontSize: 16),),
          SizedBox(height: 10),
          Text('Add video into profile to get credit ', style: TextStyle(fontSize: 14),),
          SizedBox(height: 12),
          Row(
            children: [
              Stack(
                children: [
                  Builder(builder: (_){
                    bool loading = false;
                    return StatefulBuilder(builder: (BuildContext context, void Function(void Function()) _setState) {

                      return GestureDetector(
                        onTap: () async{
                          File? video = await ImageHelper.selectVideo(ImageSource.camera);
                          if(video != null){
                            _setState((){loading = true;});
                            final link = await FStorage.storeFile(video);
                            await UserRepo.addVideo(link);
                            _setState((){loading = false;});

                          }
                        },
                        child: Container(
                          height: Get.height * .19,
                          width: Get.height * .135,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColor.LIGHT_GREY,
                              border: Border.all(color: Colors.grey),
                          ),
                          child: loading ? Loader() : Icon(Icons.videocam, color: Color(0xffA1A1A1), size: 30)
                        ),
                      );

                    });
                  }),
                  if(true)Positioned(
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
              ),
              SizedBox(width: 12),
              if(_user.videos.length > 0)Builder(builder: (_){
                bool _load = true;
                VideoPlayerController _controller;

                return StatefulBuilder(builder: (BuildContext context, void Function(void Function()) _setState) {

                  File? thumb;

                  getTemporaryDirectory().then((value) {
                    final path = value.path;
                    VideoThumbnail.thumbnailFile(
                      video: _user.videos.last.video,
                      thumbnailPath: path,
                      imageFormat: ImageFormat.WEBP,
                      maxHeight: 64, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
                      quality: 75,
                    ).then((value) {
                      setState(() {
                        thumb = File(value!);
                        _load = false;
                      });
                    });
                  });
                  return Container(
                    height: Get.height * .19,
                    width: Get.height * .135,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColor.LIGHT_GREY,
                      border: Border.all(color: Colors.grey),
                      image: _load && thumb != null ? DecorationImage(
                        image: FileImage(thumb!)
                      ) : null
                    ),
                    child: Center(
                      child: Icon(
                        Icons.video_collection
                      ),
                    ),
                    // child: _load ? Loader() : VideoPlayer(_controller),
                  );
                },);
              })
            ],
          ),
          SizedBox(height: 30,)
        ],
      );
    });
  }
}
