import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';

class SeeStories extends StatefulWidget {
  @override
  _SeeStoriesState createState() => _SeeStoriesState();
}

class _SeeStoriesState extends State<SeeStories> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.SCAFFOLD_BACKGROUND,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage('https://cdn.vox-cdn.com/thumbor/IzCqs7vYxwm8aVJvDl69CmkOU1g=/71x0:570x374/1400x1050/filters:focal(71x0:570x374):format(jpeg)/cdn.vox-cdn.com/uploads/chorus_image/image/49958765/kit-harington-sad-jon-snow-game-of-thrones.0.0.jpg'),
              fit: BoxFit.cover
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage('https://cdn.vox-cdn.com/thumbor/IzCqs7vYxwm8aVJvDl69CmkOU1g=/71x0:570x374/1400x1050/filters:focal(71x0:570x374):format(jpeg)/cdn.vox-cdn.com/uploads/chorus_image/image/49958765/kit-harington-sad-jon-snow-game-of-thrones.0.0.jpg'),
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                        SizedBox(width: 8,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('John Snow', style: TextStyle(fontSize: 16, color: Colors.white),),
                            Text('Just now', style: TextStyle(fontSize: 12, color: Colors.white),),
                          ],
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.more_horiz_rounded, color: Colors.white, size: 35,),
                        SizedBox(width: 10,),
                        Transform.rotate(
                          angle: (pi/180)*45,
                          child: Icon(Icons.add, color: Colors.white, size: 35,)),
                      ],
                    )
                  ],
                ),
              ),
              Opacity(
                opacity: 0.7,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                  ),
                  child: Center(
                    child: Icon(Icons.arrow_forward_ios_rounded, size: 18,),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          hintText: 'Say something...',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),)
                        ),
                      ),
                    )
                  ),
                  SizedBox(width: 15,),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                    ),
                    child: Center(
                      child: Icon(Icons.thumb_up_rounded, color: Color(0xff7920FF),),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                    ),
                    child: Center(
                      child: Icon(FontAwesomeIcons.solidSmile, color: Color(0xff00DC84),),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
