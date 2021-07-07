import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sayphi/mainApp/helpers/snack.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:video_player/video_player.dart';

class ImageHelper{
  static Future<File?> selectPic([ImageSource imageSource = ImageSource.gallery]) async {
    if (await Permission.photos.request().isGranted) {
      try {
        final picker = ImagePicker();
        final pickedFile = await picker.getImage(source: imageSource);
        if (pickedFile != null) {
          return File(pickedFile.path);
        }
        return null;
      } catch (e) {
        print(e.toString());
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<File?> selectVideo([ImageSource imageSource = ImageSource.gallery]) async {
    if (await Permission.photos.request().isGranted) {
      try {
        final picker = ImagePicker();
        final pickedFile = await picker.getVideo(source: imageSource);
        if (pickedFile != null) {

          final _file = File(pickedFile.path);

          VideoPlayerController controller = new VideoPlayerController.file(_file);

          if(controller.value.duration > Duration(seconds: 30)){
            Snack.top(
              title: 'Sorry',
              message: 'Video duration can not exceed 30 seconds'
            );
            return null;
          }else{
            return _file;
          }
        }
        return null;
      } catch (e) {
        print(e.toString());
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<File> cropPic(File imageFile) async {
    File? croppedFile = await ImageCropper.cropImage(
        sourcePath: imageFile.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: AppColor.PRIMARY,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        )
    );

    return croppedFile ?? imageFile;
  }

}