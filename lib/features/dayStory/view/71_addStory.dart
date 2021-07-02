import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sayphi/features/dayStory/repository/dayStoryRepo.dart';
import 'package:sayphi/mainApp/components/screenLoader.dart';
import 'package:sayphi/mainApp/helpers/imageHelper.dart';
import 'package:sayphi/mainApp/helpers/snack.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';

class AddDayStoryScreen extends StatefulWidget {
  const AddDayStoryScreen({Key? key}) : super(key: key);

  @override
  _AddDayStoryScreenState createState() => _AddDayStoryScreenState();
}

class _AddDayStoryScreenState extends State<AddDayStoryScreen> {


  File? _selectedImage;
  List<File> _imageList = [];

  saveDay() async{
    if(_imageList.length == 0){
      Snack.top(message: 'Please select and image to continue');
    }else{
      await DayStoryRepo.addToDay(_imageList);
      Get.back();
      Snack.top(
        title: 'Successful',
        message: 'Day uploaded'
      );
    }
  }

  @override
  Widget build(BuildContext context) {


    _buildImage(){
      return Expanded(
        flex: 70,
        child: _imageList.length == 0 ? Center(child: Text('Choose an image to continue')) : Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(8),
            image: DecorationImage(
              image: FileImage(_selectedImage!),
              fit: BoxFit.cover
            )
          ),
        )
      );
    }

    _buildImageList(){
      return Expanded(
        flex: 15,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _imageList.length,
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 20,top: 4,bottom: 4),
          itemBuilder: (_, index)=> Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Stack(
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      _selectedImage = _imageList[index];
                    });
                  },
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        image: DecorationImage(
                          image: FileImage(_imageList[index]),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                  ),
                ),

                Positioned(
                  right: 0,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        _imageList.remove(_imageList[index]);
                      });
                    },
                    child: Icon(Icons.cancel,color: Colors.red),
                  ),
                )

              ],
            ),
          ),
        ),
      );
    }

    _buildOptions(){
      return Expanded(
        flex: 10,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40,vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle
                ),
                constraints: BoxConstraints.tight(Size(54,54)),
                child: IconButton(
                  onPressed: () async{
                    File? image = await ImageHelper.selectPic();
                    if(image != null){
                      setState(() {
                        _selectedImage = image;
                        _imageList.add(image);
                      });
                    }
                  },
                  icon: Icon(
                    Icons.file_copy_rounded,
                    color: AppColor.DARK_GREY,
                  ),
                ),
              ),

              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle
                ),
                constraints: BoxConstraints.tight(Size(54,54)),
                child: IconButton(
                  onPressed: () async{

                    File? image = await ImageHelper.selectPic(ImageSource.camera);
                    if(image != null){
                      setState(() {
                        _selectedImage = image;
                        _imageList.add(image);
                      });
                    }

                  },
                  icon: Icon(
                    Icons.camera_alt,
                    color: AppColor.PRIMARY,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle
                ),
                constraints: BoxConstraints.tight(Size(54,54)),
                child: IconButton(
                  onPressed: () async{

                    if(_selectedImage != null){
                      final image = await ImageHelper.cropPic(_selectedImage!);
                      setState(() {
                        _imageList[_imageList.indexOf(_selectedImage!)] = image;

                        _selectedImage = image;
                      });
                    }

                  },
                  icon: Icon(
                    Icons.edit,
                    color: AppColor.DARK_GREY,
                  ),
                ),
              ),


            ],
          ),
        ),
      );
    }

    return ScreenLoader(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Add Story',
            style: TextStyle(
              color: AppColor.TEXT_COLOR,
              fontFamily: CFontFamily.REGULAR
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
                ),
                constraints: BoxConstraints.tight(Size(40,40)),
                child: IconButton(
                  onPressed: saveDay,
                  icon: Icon(
                    Icons.send,
                    size: 20,
                    color: AppColor.PRIMARY,
                  ),
                ),
              ),
            )
          ],
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            _buildImage(),

            _buildImageList(),

            _buildOptions(),

          ],
        ),

      ),
    );
  }
}
