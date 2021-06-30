import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sayphi/user/view_model/userViewModel.dart';

class FireStorage{

  FireStorage._();

  static final Reference _storage = FirebaseStorage.instance.ref();

  static Future<String> storeFile(File file,[String? name]) async{

    Reference reference = _storage.child('${UserViewModel.user.value.id}/${name == null ? DateTime.now().microsecondsSinceEpoch : name}');
    UploadTask uploadTask = reference.putFile(file);
    TaskSnapshot res = await uploadTask;
    String imageLink = await res.ref.getDownloadURL();
    return imageLink;

  }
}