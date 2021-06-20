import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';

class PrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.SCAFFOLD_BACKGROUND,
      appBar: AppBar(
        title: Text('Privacy policy', style: TextStyle(color: AppColor.TEXT_COLOR, fontSize: 16, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Text('Please read carefully our privacy policy', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColor.TEXT_COLOR),),
            SizedBox(height: 15,),
            Text('Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard.', style: TextStyle(fontSize: 14, color: AppColor.TEXT_COLOR),),
            SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check_circle, color: AppColor.PRIMARY,),
                SizedBox(width: 5,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Be yourself', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColor.TEXT_COLOR),),
                    SizedBox(height: 10,),
                    Text('Contrary to popular belief, Lorem Ipsum is not simply random text.', style: TextStyle(fontSize: 14, color: AppColor.TEXT_COLOR),),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check_circle, color: AppColor.PRIMARY,),
                SizedBox(width: 5,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Be yourself', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColor.TEXT_COLOR),),
                    SizedBox(height: 10,),
                    Text('Contrary to popular belief, Lorem Ipsum is not simply random text.', style: TextStyle(fontSize: 14, color: AppColor.TEXT_COLOR),),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              width: double.maxFinite,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.check_circle, color: AppColor.PRIMARY,),
                  SizedBox(width: 5,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Be yourself', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColor.TEXT_COLOR),),
                      SizedBox(height: 10,),
                      Text('Contrary to popular belief, Lorem Ipsum is not simply random text.', style: TextStyle(fontSize: 14, color: AppColor.TEXT_COLOR),),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Text('Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard.', style: TextStyle(fontSize: 14, color: AppColor.TEXT_COLOR),),
            SizedBox(height: 10,),
            Text('Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard.', style: TextStyle(fontSize: 14, color: AppColor.TEXT_COLOR),),
            SizedBox(height: 10,),
            Text('Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard.', style: TextStyle(fontSize: 14, color: AppColor.TEXT_COLOR),),
          ],
        ),
      ),
    );
  }
}
