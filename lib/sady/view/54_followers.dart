import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/components/loader.dart';
import 'package:sayphi/mainApp/config/graphql/apiConfig.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';

class FollowersScreen extends StatefulWidget {
  @override
  _FollowersScreenState createState() => _FollowersScreenState();
}

class _FollowersScreenState extends State<FollowersScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.SCAFFOLD_BACKGROUND,
      appBar: AppBar(
        title: Text('Followers', style: TextStyle(color: AppColor.TEXT_COLOR, fontFamily: CFontFamily.REGULAR)),
        centerTitle: true,
      ),
      body: Api.apiLoading.value ? Loader() : GridView.count(
        crossAxisCount: 3,
        padding: EdgeInsets.only(bottom: 60),
        childAspectRatio: 10.0 / 9.0,
        children: [],
      ),
    );
  }
}

