import 'package:flutter/material.dart';
import 'package:sayphi/features/homeScreen/model/matchedUserModel.dart';
import 'package:sayphi/mainApp/components/loader.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/sady/view/widgets/top_ranked_tile.dart';
import 'package:sayphi/user/repository/userRepo.dart';

class TopRankedPeopleScreen extends StatefulWidget {
  @override
  _TopRankedPeopleScreenState createState() => _TopRankedPeopleScreenState();
}

class _TopRankedPeopleScreenState extends State<TopRankedPeopleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.SCAFFOLD_BACKGROUND,
      appBar: AppBar(
        title: Text('Top ranked people', style: TextStyle(color: AppColor.TEXT_COLOR, fontSize: 16, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: UserRepo.getTopRankedUsers(),
        builder: (_, AsyncSnapshot<List<MinimalUserModel>> snapshot){
          if(snapshot.hasData && snapshot.data != null){

            snapshot.data!.sort((a,b) => a.rank.compareTo(b.rank));

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index){
                  return TopRankedTile(rank: index+1, user: snapshot.data![index]);
                }
              ),
            );
          }else{
            return Loader();
          }
        }
      ),
    );
  }
}
