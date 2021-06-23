import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';

class ProfilePageAddPromptList extends StatefulWidget {
  @override
  _ProfilePageAddPromptListState createState() => _ProfilePageAddPromptListState();
}

class _ProfilePageAddPromptListState extends State<ProfilePageAddPromptList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.SCAFFOLD_BG_PINK,
      appBar: AppBar(
        title: Text('Add a prompt',style: TextStyle(
          fontSize: 16,
          color: AppColor.TEXT_COLOR,
          fontFamily: CFontFamily.REGULAR
        ),),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
        child: ListView.builder(
          itemCount: 6,
          shrinkWrap: true,
          itemBuilder: (_, index) => Container(
            margin: EdgeInsets.only(bottom: 12),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.TEXT_LIGHT, width: 0.5),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white
            ),
            padding: EdgeInsets.all(10),
            child: Text('A book everyone should read', style: TextStyle(fontSize: 16),),
          ),
        )
      ),
    );
  }
}
