import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Snack{
  static void showError({String? title, String? message}) {
    Get.rawSnackbar(
      title: title ?? 'Error',
      message: message ?? 'Something went wrong',
      backgroundColor: Colors.red
    );
  }
}