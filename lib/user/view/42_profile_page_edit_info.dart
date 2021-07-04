import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/mainApp/view/widgets/primary_color_button.dart';
import 'package:sayphi/user/view/43_profile_page_photos.dart';
import 'package:sayphi/user/repository/userRepo.dart';
import 'package:sayphi/user/view/44_profile_page_add_prompt.dart';
import 'package:sayphi/user/view_model/userViewModel.dart';

class ProfilePageEditInfo extends StatefulWidget {
  final int tab;
  ProfilePageEditInfo({this.tab = 0});
  @override
  _ProfilePageEditInfoState createState() => _ProfilePageEditInfoState();
}

class _ProfilePageEditInfoState extends State<ProfilePageEditInfo> with SingleTickerProviderStateMixin{
  TextEditingController _nameController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _ethnicityController = TextEditingController();
  TextEditingController _religionController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _occupationController = TextEditingController();
  TextEditingController _schoolController = TextEditingController();
  TextEditingController _collegeController = TextEditingController();
  TextEditingController _relationshipGoalsController = TextEditingController();
  TextEditingController _relationshipStatusController = TextEditingController();
  TextEditingController _instagramController = TextEditingController();
  TextEditingController _spotifyController = TextEditingController();

  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController  = TabController(length: 3, vsync: this, initialIndex: widget.tab);
  }



  @override
  Widget build(BuildContext context) {
    editors(String title, String? hint, [TextEditingController? controller, bool obscure = false, bool enabled = true, TextInputType? type]){
      if(controller == null){
        enabled = false;
      }
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
              keyboardType: type,
              obscureText: obscure,
              enabled: enabled,
              controller: controller,
              style: TextStyle(
                color: AppColor.TEXT_LIGHT
              ),
              decoration: InputDecoration(
                hintText: hint ?? 'Enter your $title',
                hintStyle: TextStyle(
                  color: AppColor.TEXT_LIGHT
                )
              ),
            ))
        ],
      );
    }

    return Scaffold(
      backgroundColor: AppColor.SCAFFOLD_BG_PINK,
      appBar: AppBar(
        title: Text('Edit Profile', style: TextStyle(color: AppColor.TEXT_COLOR, fontFamily: CFontFamily.REGULAR)),
        centerTitle: true,
        actions: [

          TextButton(
            onPressed: (){

              UserRepo.updateProfile(
                nickName: _nameController.text == '' ? null : _nameController.text,
                userLocationName: _cityController.text == '' ? null : _cityController.text,
                userHeight: _heightController.text == '' ? null : int.parse(_heightController.text),
                school: _schoolController.text == '' ? null : _schoolController.text,
                college: _collegeController.text == '' ? null : _collegeController.text,
                occupation: _occupationController.text == '' ? null : _occupationController.text,
                relationStatus: _relationshipStatusController.text == '' ? null : _relationshipStatusController.text,
                relationGoal: _relationshipGoalsController.text == '' ? null : _relationshipGoalsController.text,
                instaId: _instagramController.text == '' ? null : _instagramController.text,
                spotifyId: _spotifyController.text == '' ? null : _spotifyController.text,
              );

            },
            child: Text('Save', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColor.PRIMARY))
          )
        ],
      ),
      body: Obx((){
        final _user = UserViewModel.user.value;
        return Padding(
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
                          editors('Name', _user.name , _nameController),
                          editors('Email/ Phone', _user.emailOrPhone),
                          editors('Password', '********'),
                          Divider(height: 40,),
                          Text('Edit public profile', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          editors('Age', '69'),
                          editors('City', _user.filters.location!.name, _cityController),
                          editors('Ethnicity', _user.ethnicity == null ? null : _user.ethnicity!.ethnicity , _ethnicityController, false, false),
                          editors('Religion', _user.religion == null ? null : _user.religion!.religion , _religionController, false, false),
                          editors('Height', _user.height!.toString() , _heightController, false, true, TextInputType.number),
                          editors('Occupation', _user.occupation, _occupationController),
                          editors('School', _user.school, _schoolController),
                          editors('College', _user.college, _collegeController),
                          editors('Relationship goals', _user.relationshipGoal, _relationshipGoalsController),
                          editors('Relationship status', _user.relationshipStatus, _relationshipStatusController),


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
                          PrimaryColorButton(
                            onPress: (){},
                            iconData: Icons.videocam, label: 'Watch video',),




                          Divider(height: 40,),


                          //Go live
                          Text('Go live to get credits', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                          SizedBox(height: 5,),
                          Text('Go live for 60 minutes minimum streaming to get 100 credits', style: TextStyle(fontSize: 12),),
                          SizedBox(height: 15,),
                          PrimaryColorButton(
                              onPress: (){},
                              iconData: Icons.ondemand_video_rounded, label: 'Go live'),



                          Divider(height: 40,),



                          //Connect instagram
                          Text('Connect Instagram', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                          SizedBox(height: 5,),
                          Text('Connect Instagram to add your latest photos to your profile, Don\'t worry we don\'t share any information.', style: TextStyle(fontSize: 12),),
                          SizedBox(height: 15,),
                          PrimaryColorButton(
                            onPress: () async{
                              await showCupertinoDialog(context: context, builder: (_)=>CupertinoAlertDialog(
                                title: Text(
                                  'Enter your Instagram',
                                ),
                                content: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  child: Material(
                                    child: SizedBox(
                                      height: 40,
                                      child: TextField(
                                        controller: _instagramController,
                                        decoration: InputDecoration(
                                          hintText: 'Your instagram id'
                                        )
                                      )
                                    ),
                                  ),
                                ),
                                actions: [
                                  CupertinoDialogAction(
                                    child: Text(
                                      'Cancel'
                                    ),
                                    isDestructiveAction: true,
                                    onPressed: (){
                                      Get.back(result: null);
                                      _instagramController.clear();
                                    },
                                  ),
                                  CupertinoDialogAction(
                                    child: Text(
                                      'Confirm'
                                    ),
                                    onPressed: (){
                                      if(_instagramController.text != ''){
                                        Get.back(result: _instagramController.text);
                                      }
                                    },
                                  ),
                                ],
                              ));
                            },
                            iconData: FontAwesomeIcons.instagram,
                            label: _user.instagramId == null ? 'Connect Instagram' : _user.instagramId!,
                          ),



                          Divider(height: 40,),



                          //Connect spotify
                          Text('Connect Spotify', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                          SizedBox(height: 5,),
                          Text('Connect Spotify to be updated,Don\'t worry we don\'t share any information.', style: TextStyle(fontSize: 12),),
                          SizedBox(height: 15,),
                          PrimaryColorButton(
                            onPress: ()async{
                              await showCupertinoDialog(context: context, builder: (_)=>CupertinoAlertDialog(
                                title: Text(
                                  'Enter your Spotify id',
                                ),
                                content: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  child: Material(
                                    child: SizedBox(
                                        height: 40,
                                        child: TextField(
                                            controller: _spotifyController,
                                            decoration: InputDecoration(
                                                hintText: 'Your Spotify id'
                                            )
                                        )
                                    ),
                                  ),
                                ),
                                actions: [
                                  CupertinoDialogAction(
                                    child: Text(
                                        'Cancel'
                                    ),
                                    isDestructiveAction: true,
                                    onPressed: (){
                                      Get.back(result: null);
                                      _spotifyController.clear();
                                    },
                                  ),
                                  CupertinoDialogAction(
                                    child: Text(
                                        'Confirm'
                                    ),
                                    onPressed: (){
                                      if(_spotifyController.text != ''){
                                        Get.back(result: _spotifyController.text);
                                      }
                                    },
                                  ),
                                ],
                              ));
                            },
                            iconData: FontAwesomeIcons.spotify,
                              label: _user.spotifyId == null ? 'Connect Spotify' : _user.spotifyId!
                          ),




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
        );
      }),
    );
  }
}
