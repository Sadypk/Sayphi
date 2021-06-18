import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayphi/app.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  //Variables
  String selectedInterest ='';
  String selectedFilterBy ='';
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.SCAFFOLD_BG_PINK,
      appBar: AppBar(
        title: Text('Profile settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          //Boost and subscription
          Container(
            height: 80,
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.white
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Boost and subscription', style: TextStyle(color: AppColor.PRIMARY, fontSize: 16),),
                SizedBox(height: 5,),
                Text('Boost and buy subscriptions for your id to get a first class dating experience', style: TextStyle(fontSize: 12, color: AppColor.TEXT_LIGHT), textAlign: TextAlign.center,),
              ],
            ),
          ),


          SizedBox(height: 20,),

          //User rank / Received credit
          Container(
            height: 80,
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('User rank / Received credit', style: TextStyle(color: AppColor.PRIMARY, fontSize: 16),),
                SizedBox(height: 5,),
                Text('To update your user rank and get more credits purchase your suitable pack', style: TextStyle(fontSize: 12, color: AppColor.TEXT_LIGHT), textAlign: TextAlign.center,),
              ],
            ),
          ),


          SizedBox(height: 20,),


          //Filter option
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Filter option', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                SizedBox(height: 25,),
                
                
                //Location
                Text('Location', style: TextStyle(fontSize: 16),),
                SizedBox(height: 10,),
                Container(
                  height: 40,
                  color: Colors.white,
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      suffixIcon: Transform.rotate(
                          angle: 45,
                          child: Icon(Icons.navigation, color: AppColor.DARK_GREY,)),
                      hintText: 'Search nearby',
                      hintStyle: TextStyle(fontSize: 12, color: AppColor.TEXT_LIGHT),
                    ),
                  ),
                ),


                SizedBox(height: 20,),


                //I'm interested in
                Text('I\'m interested in', style: TextStyle(fontSize: 16),),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Flexible(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            selectedInterest = 'Men';
                          });
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: selectedInterest=='Men'?Colors.lightBlueAccent:Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: selectedInterest=='Men'?Colors.transparent:AppColor.BORDER_COLOR.withOpacity(0.3), width: 1)
                          ),
                          child: Center(
                            child: Text('Men', style: TextStyle(fontSize: 12, color: selectedInterest=='Men'?Colors.white:AppColor.TEXT_LIGHT),),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Flexible(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            selectedInterest = 'Women';
                          });
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: selectedInterest=='Women'?Colors.lightBlueAccent:Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: selectedInterest=='Women'?Colors.transparent:AppColor.BORDER_COLOR.withOpacity(0.3), width: 1)
                          ),
                          child: Center(
                            child: Text('Women', style: TextStyle(fontSize: 12, color: selectedInterest=='Women'?Colors.white:AppColor.TEXT_LIGHT),),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Flexible(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            selectedInterest = 'Both';
                          });
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: selectedInterest=='Both'?Colors.lightBlueAccent:Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: selectedInterest=='Both'?Colors.transparent:AppColor.BORDER_COLOR.withOpacity(0.3), width: 1)
                          ),
                          child: Center(
                            child: Text('Both', style: TextStyle(fontSize: 12, color: selectedInterest=='Both'?Colors.white:AppColor.TEXT_LIGHT),),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),



                SizedBox(height: 20,),



                //Filter by
                Text('Filter by', style: TextStyle(fontSize: 16),),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Flexible(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            selectedFilterBy = 'All';
                          });
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: selectedFilterBy=='All'?Colors.lightBlueAccent:Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: selectedFilterBy=='All'?Colors.transparent:AppColor.BORDER_COLOR.withOpacity(0.3), width: 1)
                          ),
                          child: Center(
                            child: Text('All', style: TextStyle(fontSize: 12, color: selectedFilterBy=='All'?Colors.white:AppColor.TEXT_LIGHT),),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Flexible(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            selectedFilterBy = 'Online';
                          });
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: selectedFilterBy=='Online'?Colors.lightBlueAccent:Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: selectedFilterBy=='Online'?Colors.transparent:AppColor.BORDER_COLOR.withOpacity(0.3), width: 1)
                          ),
                          child: Center(
                            child: Text('Online', style: TextStyle(fontSize: 12, color: selectedFilterBy=='Online'?Colors.white:AppColor.TEXT_LIGHT),),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Flexible(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            selectedFilterBy = 'New';
                          });
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: selectedFilterBy=='New'?Colors.lightBlueAccent:Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: selectedFilterBy=='New'?Colors.transparent:AppColor.BORDER_COLOR.withOpacity(0.3), width: 1)
                          ),
                          child: Center(
                            child: Text('New', style: TextStyle(fontSize: 12, color: selectedFilterBy=='New'?Colors.white:AppColor.TEXT_LIGHT),),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
