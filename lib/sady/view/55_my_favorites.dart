import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';

class MyFavorites extends StatefulWidget {
  @override
  _MyFavoritesState createState() => _MyFavoritesState();
}

class _MyFavoritesState extends State<MyFavorites> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.SCAFFOLD_BACKGROUND,
      appBar: AppBar(
        title: Text('My Favourites', style: TextStyle(color: AppColor.TEXT_COLOR, fontFamily: CFontFamily.REGULAR)),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        padding: EdgeInsets.only(bottom: 60),
        childAspectRatio: 10.0 / 9.0,
        children: [],
      ),
    );
  }
}

class FollowerModel{

}