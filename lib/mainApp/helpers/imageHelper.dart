import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

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

}