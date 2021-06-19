import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/sady/view/widgets/top_ranked_tile.dart';

class TopRankedPeople extends StatefulWidget {
  @override
  _TopRankedPeopleState createState() => _TopRankedPeopleState();
}

class _TopRankedPeopleState extends State<TopRankedPeople> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.SCAFFOLD_BACKGROUND,
      appBar: AppBar(
        title: Text('Top ranked people', style: TextStyle(color: AppColor.TEXT_COLOR, fontSize: 16, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index){
            return TopRankedTile(rank: index+1,);
          }
        ),
      ),
    );
  }
}
