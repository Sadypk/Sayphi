import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sayphi/features/homeScreen/model/matchedUserModel.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';

class TopRankedTile extends StatelessWidget {
  TopRankedTile({required this.rank, required this.user});
  final int rank;
  final MinimalUserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: rank>3?null:DecorationImage(
                      image: AssetImage('assets/icons/Group 2764.png'),
                      fit: BoxFit.cover
                    )
                  ),
                  child: Center(
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text('$rank', style: TextStyle(color: rank>3?AppColor.TEXT_COLOR:Colors.white,fontWeight: FontWeight.bold, fontSize: 14),)),
                  ),
                ),
                SizedBox(width: 10,),
                Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColor.PRIMARY, width: 0.8),
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(user.image),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.name, style: TextStyle(color: AppColor.TEXT_COLOR, fontSize: 16),),
                    SizedBox(height: 5,),
                    Text(user.address, style: TextStyle(color: AppColor.TEXT_COLOR, fontSize: 12),),
                    SizedBox(height: 5,),
                    Container(
                      height: 18,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColor.PRIMARY, width: 0.8)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.heart, color: AppColor.PRIMARY, size: 12,),
                          SizedBox(width: 5,),
                          Text(user.rank.toString(), style: TextStyle(color: AppColor.PRIMARY, fontSize: 12),)
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.gift, color: AppColor.PRIMARY,),
                SizedBox(height: 5,),
                Text('Send gift', style: TextStyle(fontSize: 12, color: AppColor.TEXT_COLOR),)
              ],
            )
          ],
        ),
        Divider(height: 30,)
      ],
    );
  }
}
