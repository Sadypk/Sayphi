import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sayphi/mainApp/components/mainButton.dart';
import 'package:sayphi/mainApp/components/screenLoader.dart';
import 'package:sayphi/mainApp/config/firebase/fStorage.dart';
import 'package:sayphi/mainApp/helpers/imageHelper.dart';
import 'package:sayphi/mainApp/helpers/snack.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/appImages.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/user/repository/userRepo.dart';
import 'package:sayphi/user/view/14_password_set_screen.dart';

class UploadPhotoViewScreen extends StatefulWidget {
  const UploadPhotoViewScreen({Key? key}) : super(key: key);

  @override
  _UploadPhotoViewScreenState createState() => _UploadPhotoViewScreenState();
}

class _UploadPhotoViewScreenState extends State<UploadPhotoViewScreen> {

  bool showImagePickers = false;

  List<File> files = [
    File(''),
    File(''),
    File(''),
    File(''),
    File(''),
    File(''),
    File(''),
    File(''),
  ];


  Future<void> getImage([ImageSource source = ImageSource.gallery]) async{
    File? image = await ImageHelper.selectPic(source);
    if(image != null){
      for(int i = 0 ; i< 8 ; i++){
        if(files[i].path == ''){
          setState(() {
            files[i] = image;
          });
          return ;
        }
      }
    }
  }

  bool screenLoader = false;

  @override
  Widget build(BuildContext context) {

    /// Base info widgets about photo upload
    _buildBaseInfo(){
      return Column(
        children: [
          Text(
            'Upload your photos/videos',
            style: TextStyle(
                fontSize: 20,
                fontFamily: CFontFamily.MEDIUM
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Upload your photos and video to amaze others and increase your visibility',
            style: TextStyle(
                fontFamily: CFontFamily.REGULAR
            ),
          ),

          /// basic info`s suggestions about image uploads
          SizedBox(height: 20),
          Row(
            children: [
              Icon(
                Icons.circle,
                color: AppColor.PRIMARY,
                size: 18,
              ),
              SizedBox(width: 8),
              Text(
                  'Add your intro video to attract more people'
              )
            ],
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(
                Icons.circle,
                color: AppColor.PRIMARY,
                size: 18,
              ),
              SizedBox(width: 8),
              Text(
                  'Avoid group pictures'
              )
            ],
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(
                Icons.circle,
                color: AppColor.PRIMARY,
                size: 18,
              ),
              SizedBox(width: 8),
              Text(
                  'First one will be your profile image'
              )
            ],
          ),
          SizedBox(height: Get.height * .1),
        ],
      );
    }

    /// image pickers
    _buildImagePickerOptions(){
      return GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 10/13,
        children: [
          GestureDetector(
            onTap: () async{
              await getImage(ImageSource.camera);
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.PRIMARY,
                borderRadius: BorderRadius.circular(6)
              ),
              child: Center(child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 35,
              )),
            ),
          ),
          for(int i =0; i< 8; i++) files[i].path != '' ? Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(
                      files[i]
                    ),
                    fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(6)
                ),
              ),
              Positioned(
                right: 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.PRIMARY,
                    shape: BoxShape.circle
                  ),
                  child: IconButton(
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.zero,
                      onPressed: (){
                        setState(() {
                          files.removeAt(i);
                          files.add(File(''));
                        });
                      },
                      icon: Icon(
                        Icons.cancel_rounded,
                        color: Colors.white
                      )
                  ),
                ),
              )
            ],
          ) : GestureDetector(
            onTap: () async{
              await getImage();
            },
            child: PlaceHolderImageWidget())
        ],
      );
    }

    return ScreenLoader(
      loader: screenLoader,
      child: Scaffold(
        backgroundColor: AppColor.SCAFFOLD_BG_PINK,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            showImagePickers ? 'Add photo/video' : '',
            style: TextStyle(color: AppColor.TEXT_COLOR),
          )
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedCrossFade(
                firstChild: _buildBaseInfo(),
                secondChild: _buildImagePickerOptions(),
                duration: Duration(milliseconds: 400),
                crossFadeState: showImagePickers ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              ),

              /// big image add btn
              if(!showImagePickers)GestureDetector(
                onTap: (){
                  setState(() {
                    showImagePickers = true;
                  });
                },
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.PRIMARY.withOpacity(.1)
                        ),
                      ),
                      Positioned(
                        left: 42,
                        right: 42,
                        top: 42,
                        bottom: 42,
                        child: Image.asset(
                          Images.ICON_GALLERY_IMAGE
                        ),
                      ),
                      Positioned(
                        top: 70,
                        left: 50,
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 16,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Add',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            )
                          ],
                        )
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(20),
          child: MainButton(
            onPress: () async{
              /// if info is showing show the image pickers next
              /// instead of uploading image
              /// which would fail since there are none
              if(!showImagePickers){
                setState(() {
                  showImagePickers = true;
                });
              }else{
                /// uploading selected images if there are any
                bool hasFile = false;
                files.forEach((element) {
                  if(element.path != ''){
                    hasFile = true;
                  }
                });


                if(hasFile){

                  setState(() {
                    screenLoader = true;
                  });

                  final _uploadFiles = files.where((element) => element.path != '');

                  final _links = await Future.wait(_uploadFiles.map((e) => FStorage.storeFile(e)));

                  for(int i =0; i< _links.length; i++){
                    if(i==0){
                      await UserRepo.updateProfile(profileImage: _links[i]);
                      await UserRepo.addImage(_links[i]);
                    }else{
                      await UserRepo.addImage(_links[i]);
                    }
                  }

                  setState(() {
                    screenLoader = false;
                  });
                  Get.to(()=>SetPasswordScreen());
                }else{
                  Snack.top(title: 'Please upload an image', message: 'Select atleast 1 image to continue');
                }
              }
            },
            label: 'Upload photo/video'
          ),
        ),
      ),
    );
  }
}

class PlaceHolderImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Color(0xffE8E8E8),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Color(0xff434448).withOpacity(.3))
          ),
          child: Center(child: Icon(
            Icons.camera_alt,
            color: Color(0xffA1A1A1),
            size: 30,
          )),
        ),
        Positioned(
          bottom: 8,
          right: 8,
          child: Icon(
            Icons.add_circle_rounded,
            color: AppColor.PRIMARY,
          ),
        )
      ],
    );
  }
}
