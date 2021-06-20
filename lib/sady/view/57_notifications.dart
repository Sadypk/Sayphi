import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.SCAFFOLD_BACKGROUND,
      appBar: AppBar(
        title: Text('Notifications', style: TextStyle(color: AppColor.TEXT_COLOR, fontSize: 16, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
