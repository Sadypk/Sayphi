import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/view/widgets/primary_color_button.dart';
import 'package:sayphi/sady/view/43_profile_page_photos.dart';
import 'package:sayphi/sady/view/44_profile_page_add_prompt.dart';

class ProfilePageEditInfo extends StatefulWidget {
  @override
  _ProfilePageEditInfoState createState() => _ProfilePageEditInfoState();
}

class _ProfilePageEditInfoState extends State<ProfilePageEditInfo> with SingleTickerProviderStateMixin{
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _ethnicityController = TextEditingController();
  TextEditingController _religionController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _occupationController = TextEditingController();
  TextEditingController _schoolController = TextEditingController();
  TextEditingController _collegeController = TextEditingController();
  TextEditingController _relationshipGoalsController = TextEditingController();
  TextEditingController _relationshipStatusController = TextEditingController();

  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController  = TabController(length: 3, vsync: this);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    editors(String title, String hint, TextEditingController controller){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 4,
            child: Text(title, style: TextStyle(fontSize: 16),)),
          Flexible(
            flex: 6,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hint,
              ),
            ))
        ],
      );
    }

    return Scaffold(
      backgroundColor: AppColor.SCAFFOLD_BG_PINK,
      appBar: AppBar(
        title: Text('Edit Profile', style: TextStyle(color: Colors.black87),),
        centerTitle: true,
        actions: [
          Center(child: Text('Save  ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColor.PRIMARY),)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TabBar(
              controller: tabController,
              indicatorColor: AppColor.PRIMARY,
              labelColor: AppColor.TEXT_COLOR,
              indicatorWeight: 4,
              labelStyle: TextStyle(fontSize: 18),
              tabs: [
                Tab(text: 'Detail',),
                Tab(text: 'Photos',),
                Tab(text: 'Prompts',),]
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  ListView(
                    children: [
                      SizedBox(height: 20,),

                      //Form
                      Text('Edit personal profile', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      editors('Name', 'Katerina Aleria', _nameController),
                      editors('Email', 'Katerina@gmail.com', _emailController),
                      editors('Password', '********', _nameController),
                      Divider(height: 40,),
                      Text('Edit public profile', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      editors('Age', '28', _nameController),
                      editors('City', 'Khulna', _nameController),
                      editors('Ethnicity', 'Asian', _nameController),
                      editors('Religion', 'Muslim', _nameController),
                      editors('Height', '168 cm', _nameController),
                      editors('Occupation', 'UI Designer', _nameController),
                      editors('School', 'School name here', _nameController),
                      editors('College', 'College name here', _nameController),
                      editors('Relationship goals', 'Prefer not to say', _nameController),
                      editors('Relationship status', 'Married', _nameController),


                      Divider(height: 40,),


                      //My Gifts
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('My Gifts', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                          Text('View all gifts', style: TextStyle(fontSize: 12, color: AppColor.PRIMARY),)
                        ],
                      ),
                      SizedBox(height: 15,),
                      Container(
                        height: 80,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index){
                            return Container(
                              height: 80,
                              width: 80,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xffE8E8E8),
                                border: Border.all(color: AppColor.BORDER_COLOR, width: 0.5)
                              ),
                              child: Center(child: Icon(
                                CupertinoIcons.gift_fill ,
                                color: AppColor.PRIMARY,
                                size: 36,
                              ),),
                            );
                          }),
                      ),


                      Divider(height: 40,),


                      //Watch an ad
                      Text('Watch an ad to get credit', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      SizedBox(height: 15,),
                      PrimaryColorButton(iconData: Icons.videocam, label: 'Watch video',),




                      Divider(height: 40,),


                      //Go live
                      Text('Go live to get credits', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      SizedBox(height: 5,),
                      Text('Go live for 60 minutes minimum streaming to get 100 credits', style: TextStyle(fontSize: 12),),
                      SizedBox(height: 15,),
                      PrimaryColorButton(iconData: Icons.ondemand_video_rounded, label: 'Go live'),



                      Divider(height: 40,),



                      //Connect instagram
                      Text('Connect Instagram', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      SizedBox(height: 5,),
                      Text('Connect Instagram to add your latest photos to your profile, Don\'t worry we don\'t share any information.', style: TextStyle(fontSize: 12),),
                      SizedBox(height: 15,),
                      PrimaryColorButton(iconData: FontAwesomeIcons.instagram, label: 'Connect Instagram', ),



                      Divider(height: 40,),



                      //Connect spotify
                      Text('Connect Spotify', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      SizedBox(height: 5,),
                      Text('Connect Spotify to be updated,Don\'t worry we don\'t share any information.', style: TextStyle(fontSize: 12),),
                      SizedBox(height: 15,),
                      PrimaryColorButton(iconData: FontAwesomeIcons.spotify, label: 'Go live'),




                      SizedBox(height: 30,)
                    ],
                  ),
                  ProfilePagePhotos(),
                  ProfilePageAddPrompt()
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}
