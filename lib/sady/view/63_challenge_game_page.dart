import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';

class ChallengeGamePage extends StatefulWidget {
  @override
  _ChallengeGamePageState createState() => _ChallengeGamePageState();
}

class _ChallengeGamePageState extends State<ChallengeGamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.SCAFFOLD_BACKGROUND,
      appBar: AppBar(
        title: Text('Questions', style: TextStyle(color: AppColor.TEXT_COLOR, fontSize: 16, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text('Question 1 of 10', style: TextStyle(fontSize: 12, color: AppColor.TEXT_COLOR),),
                SizedBox(height: 100,),
                Text('Who is your personal hero', style: TextStyle(fontSize: 16, color: AppColor.TEXT_COLOR),),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      hintText: 'Write your answer...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      suffixIcon: Icon(Icons.arrow_forward_ios_rounded, color: Colors.black87,)
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: AppColor.PRIMARY,
                    shape: BoxShape.circle
                  ),
                  child: Center(
                    child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
