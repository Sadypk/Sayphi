import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sayphi/demo_files.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';

class LiveUserGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 160/130,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12
      ),
      shrinkWrap: true,
      itemCount: Demo.DEMO_USERS.length,
      itemBuilder: (_, index) => LiveUserGridTile(image: Demo.DEMO_USERS[index]),
    );
  }
}

class LiveUserGridTile extends StatelessWidget {
  final String image;
  const LiveUserGridTile({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColor.PRIMARY),
          image: DecorationImage(
              image: CachedNetworkImageProvider(image),
              fit: BoxFit.cover
          )
      ),
      child:  Stack(
        children: [
          //CachedNetworkImage(imageUrl: url),
          // Image.asset(url),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.0, 0.5],
                  colors: <Color>[
                    AppColor.PRIMARY.withOpacity(0.7),
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
              'Jon Snow',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.white),
            ),
          ),
          Positioned(
            top: 7,
            left: 7,
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
                    '69k',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500,color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

