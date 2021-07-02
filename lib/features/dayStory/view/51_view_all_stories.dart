import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/features/dayStory/view/52_storyViewScreen.dart';
import 'package:sayphi/features/dayStory/view_model/dayViewModel.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';

class ViewAllStoriesScreen extends StatefulWidget {
  @override
  _ViewAllStoriesScreenState createState() => _ViewAllStoriesScreenState();
}

class _ViewAllStoriesScreenState extends State<ViewAllStoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.SCAFFOLD_BACKGROUND,
      appBar: AppBar(
        title: Text('All stories', style: TextStyle(fontSize: 16, color: AppColor.TEXT_COLOR),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.only(bottom: 60),
          childAspectRatio: 10.0 / 9.0,
          children: DayViewModel.allDay.map((userDay) {
            return GestureDetector(
              onTap: (){
                Get.to(()=>SeeStoryView(storyIndex: DayViewModel.allDay.indexOf(userDay)));
              },
              child: Container(
                margin: EdgeInsets.only(right: 10,bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColor.PRIMARY),
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(userDay.day.last.image),
                        fit: BoxFit.cover
                    )
                ),
                child:  Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: [0.0, .4],
                            colors: <Color>[
                              AppColor.PRIMARY,
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 7,
                      left: 7,
                      child: Text(
                        userDay.name,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.white),
                      ),
                    ),
                    Positioned(
                      top: 7,
                      left: 7,
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColor.PRIMARY, width: 1),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(userDay.profileImage),
                            fit: BoxFit.cover
                          )
                        ),
                      )
                    ),
                    Positioned(
                      top: 7,
                      right: 7,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.white),
                          color: AppColor.DARK_GREY.withOpacity(0.8),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.remove_red_eye,color: Colors.white,size: 15,),
                            SizedBox(width: 3,),
                            Text(
                              userDay.day.length.toString(),
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500,color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
