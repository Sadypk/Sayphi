import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';

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
        title: Text('Add a prompt'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.TEXT_LIGHT, width: 0.5),
                  borderRadius: BorderRadius.circular(5)
              ),
              padding: EdgeInsets.all(10),
              child: Text('A book everyone should read', style: TextStyle(fontSize: 16),),
            )
          ],
        ),
      ),
    );
  }
}
