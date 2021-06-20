import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';

class TransactionTile extends StatelessWidget {
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
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: AppColor.PRIMARY,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Container(
                      height: 20,
                      width: 20,
                      child: Image.asset('assets/icons/Icon awesome-credit-card.png', fit: BoxFit.cover,),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Amount add from ABC Bank', style: TextStyle(fontSize: 14, color: AppColor.TEXT_COLOR),),
                    SizedBox(height: 5,),
                    Text('May 10, 2021 - 9:30AM', style: TextStyle(fontSize: 12, color: AppColor.TEXT_LIGHT),),
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('120.00\$', style: TextStyle(fontSize: 14, color: AppColor.TEXT_COLOR),),
                SizedBox(height: 5,),
                Text('Success', style: TextStyle(fontSize: 8, color: Color(0xff397A23)),),
              ],
            )
          ],
        ),
        Divider(height: 40, thickness: 1,),
      ],
    );
  }
}
