import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Snack{
  static void showError({String? title, String? message}){
    Get.rawSnackbar(
        backgroundColor: Color(0xffAA0000),
        title: title ?? 'Error',
        message: message ?? 'Something Went wrong',
        margin: EdgeInsets.all(20),
        borderRadius: 12
    );
  }

  static void top({String? title, String? message, VoidCallback? onPress}){
    Get.snackbar(
        title ?? 'Wait!',
        message ?? 'Please complete this task',
        colorText: Colors.white,
        backgroundColor: Color(0xFF6DC046),
        mainButton: onPress == null ? null : TextButton(onPressed: onPress, child: Text('Allow')),
        borderRadius: 12,
        margin: EdgeInsets.all(20)
    );
  }
}