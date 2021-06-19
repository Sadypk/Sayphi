import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/components/chat_head.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';

class ChatHeadModel{
  String? image;
  bool? isOnline;

  ChatHeadModel({
    this.image,
    this.isOnline
  });
}

class MyFavorites extends StatefulWidget {
  @override
  _MyFavoritesState createState() => _MyFavoritesState();
}

class _MyFavoritesState extends State<MyFavorites> {
  List<Widget> imageList = [
    ChatHead(true, 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'John Snow', 69),
    ChatHead(false, 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'John Snow', 69),
    ChatHead(true, 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'John Snow', 69),
    ChatHead(true, 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'John Snow', 69),
    ChatHead(false, 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'John Snow', 69),
    ChatHead(false, 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'John Snow', 69),
    ChatHead(false, 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'John Snow', 69),
    ChatHead(false, 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'John Snow', 69),
    ChatHead(true, 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'John Snow', 69),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.SCAFFOLD_BACKGROUND,
      appBar: AppBar(
        title: Text('Followers', style: TextStyle(color: AppColor.TEXT_COLOR, fontSize: 16),),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        padding: EdgeInsets.only(bottom: 60),
        childAspectRatio: 10.0 / 9.0,
        children: imageList,
      ),
    );
  }
}

