import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';

class ProfilePagePhotos extends StatefulWidget {
  @override
  _ProfilePagePhotosState createState() => _ProfilePagePhotosState();
}

class _ProfilePagePhotosState extends State<ProfilePagePhotos> {
  previewCard(String image, bool isSelected, Function onTap, bool isVideo){
    return Flexible(
      child: Stack(
        children: [
          Container(
            height: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: isSelected?Colors.transparent:AppColor.LIGHT_GREY,
                border: Border.all(color: isSelected?Colors.transparent:Colors.grey),
              image: isSelected?DecorationImage(
                image: NetworkImage('https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                fit: BoxFit.cover
              ):null
            ),
            child: isSelected?null:Center(
              child: Icon(isVideo?Icons.videocam:Icons.camera_alt_rounded, color: Color(0xffA1A1A1), size: 30,),
            )
            ,
          ),
          if(!isSelected)Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.PRIMARY
              ),
              child: Center(
                child: Icon(Icons.add, color: Colors.white, size: 16,),
              ),
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        //Add photos
        Text('Add photos', style: TextStyle(fontSize: 16),),
        SizedBox(height: 10,),
        Text('Add photos', style: TextStyle(fontSize: 14),),
        SizedBox(height: 10,),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            previewCard('https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', true, (){}, false),
            SizedBox(width: 15,),
            previewCard('', false, (){}, false),
            SizedBox(width: 15,),
            previewCard('', false, (){}, false),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            previewCard('', false, (){}, false),
            SizedBox(width: 15,),
            previewCard('', false, (){}, false),
            SizedBox(width: 15,),
            previewCard('', false, (){}, false),
          ],
        ),


        SizedBox(height: 30,),


        //Add videos
        Text('Add photos', style: TextStyle(fontSize: 16),),
        SizedBox(height: 10,),
        Text('Add video into profile to get credit ', style: TextStyle(fontSize: 14),),
        SizedBox(height: 10,),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            previewCard('', false, (){}, true),
            SizedBox(width: 15,),
            previewCard('', false, (){}, true),
            SizedBox(width: 15,),
            previewCard('', false, (){}, true),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            previewCard('', false, (){}, true),
            SizedBox(width: 15,),
            previewCard('', false, (){}, true),
            SizedBox(width: 15,),
            previewCard('', false, (){}, true),
          ],
        ),


        SizedBox(height: 30,)
      ],
    );
  }
}
