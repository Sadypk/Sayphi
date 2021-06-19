import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';

class AddStory extends StatefulWidget {
  @override
  _AddStoryState createState() => _AddStoryState();
}

class _AddStoryState extends State<AddStory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add story', style: TextStyle(color: AppColor.TEXT_COLOR, fontSize: 16),),
          centerTitle: true,
      ),
      // body: ,
    );
  }
}
