import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/components/chat_head.dart';
import 'package:sayphi/mainApp/components/loader.dart';
import 'package:sayphi/mainApp/model/otherUserModel.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/user/repository/userRepo.dart';

class FollowersScreen extends StatelessWidget {
  const FollowersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.SCAFFOLD_BACKGROUND,
        appBar: AppBar(
          title: Text('Followers', style: TextStyle(color: AppColor.TEXT_COLOR, fontFamily: CFontFamily.REGULAR)),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: UserRepo.getFollowers(),
          builder: (_, AsyncSnapshot<List<OtherUserModel>> snapshot){
            if(snapshot.hasData && snapshot.data != null){

              print(snapshot.data!.length);

              return GridView.count(
                crossAxisCount: 3,
                padding: EdgeInsets.all(20),
                childAspectRatio: 10.0 / 11.0,
                children: snapshot.data!.map((e) => ChatHead(user: e)).toList(),
              );
            }else{
              return Loader();
            }
          },
        )
    );
  }
}
