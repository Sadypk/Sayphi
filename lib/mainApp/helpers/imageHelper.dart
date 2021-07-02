import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';

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