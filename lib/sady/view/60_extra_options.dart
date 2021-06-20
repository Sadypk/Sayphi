import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';

class ExtraOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.SCAFFOLD_BACKGROUND,
      appBar: AppBar(
        title: Text('Extra', style: TextStyle(color: AppColor.TEXT_COLOR, fontSize: 16, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15,),
            Text('Pause account', style: TextStyle(fontSize: 16, color: AppColor.TEXT_COLOR),),
            Divider(height: 30,),
            Text('Delete account', style: TextStyle(fontSize: 16, color: AppColor.TEXT_COLOR),),
            Divider(height: 30,),
            Text('Logout', style: TextStyle(fontSize: 16, color: AppColor.TEXT_COLOR),),
            Divider(height: 30,),
          ],
        ),
      ),
    );
  }
}
