import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/demo_files.dart';
import 'package:sayphi/features/chat_messaging/view/widgets/chat_head.dart';
import 'package:sayphi/mainApp/components/loader.dart';
import 'package:sayphi/mainApp/model/otherUserModel.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/user/repository/userRepo.dart';

class LikesListScreen extends StatelessWidget {
  const LikesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20,top: 12),
      child: ListView(
        children: [
          FutureBuilder(
            future: UserRepo.getUserLikes(),
            builder: (_, AsyncSnapshot<List<OtherUserModel>> snapshot){
              if(snapshot.hasData && snapshot.data != null){
                return LikesInfoHorizontalList(title: 'My likes', data: snapshot.data!);
              }else{
                return Loader();
              }
            },
          ),
          FutureBuilder(
            future: UserRepo.getUserLikers(),
            builder: (_, AsyncSnapshot<List<OtherUserModel>> snapshot){
              if(snapshot.hasData && snapshot.data != null){
                return LikesInfoHorizontalList(title: 'Who liked me', data: snapshot.data!);
              }else{
                return Loader();
              }
            },
          ),
          FutureBuilder(
            future: UserRepo.getUserVisitors(),
            builder: (_, AsyncSnapshot<List<OtherUserModel>> snapshot){
              if(snapshot.hasData && snapshot.data != null){
                return LikesInfoHorizontalList(title: 'Who visited me', data: snapshot.data!);
              }else{
                return Loader();
              }
            },
          ),
          // LikesInfoHorizontalList(title: 'My Matches'),
          // LikesInfoHorizontalList(title: 'Who sent credits/ gifts'),
        ],
      ),
    );
  }
}

class LikesInfoHorizontalList extends StatelessWidget {
  final String title;
  final List<OtherUserModel> data;
  const LikesInfoHorizontalList({Key? key, required this.title, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontFamily: CFontFamily.MEDIUM
            ),
          ),
          SizedBox(height: 12),

          SizedBox(
            height: Get.height * .1,
            child: data.length > 0 ? ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return ChatHeader(user: data[index], isActive: index%2==0);
              },
            ) : Center(child: Text('Empty'))
          )
        ],
      ),
    );
  }
}
