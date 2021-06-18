import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';

class LiveVideo extends StatelessWidget {

  final List<String> images = [
    "https://cdn.vox-cdn.com/thumbor/IzCqs7vYxwm8aVJvDl69CmkOU1g=/71x0:570x374/1400x1050/filters:focal(71x0:570x374):format(jpeg)/cdn.vox-cdn.com/uploads/chorus_image/image/49958765/kit-harington-sad-jon-snow-game-of-thrones.0.0.jpg",
    "https://cdn.vox-cdn.com/thumbor/IzCqs7vYxwm8aVJvDl69CmkOU1g=/71x0:570x374/1400x1050/filters:focal(71x0:570x374):format(jpeg)/cdn.vox-cdn.com/uploads/chorus_image/image/49958765/kit-harington-sad-jon-snow-game-of-thrones.0.0.jpg",
    "https://cdn.vox-cdn.com/thumbor/IzCqs7vYxwm8aVJvDl69CmkOU1g=/71x0:570x374/1400x1050/filters:focal(71x0:570x374):format(jpeg)/cdn.vox-cdn.com/uploads/chorus_image/image/49958765/kit-harington-sad-jon-snow-game-of-thrones.0.0.jpg",
    "https://cdn.vox-cdn.com/thumbor/IzCqs7vYxwm8aVJvDl69CmkOU1g=/71x0:570x374/1400x1050/filters:focal(71x0:570x374):format(jpeg)/cdn.vox-cdn.com/uploads/chorus_image/image/49958765/kit-harington-sad-jon-snow-game-of-thrones.0.0.jpg",
    "https://cdn.vox-cdn.com/thumbor/IzCqs7vYxwm8aVJvDl69CmkOU1g=/71x0:570x374/1400x1050/filters:focal(71x0:570x374):format(jpeg)/cdn.vox-cdn.com/uploads/chorus_image/image/49958765/kit-harington-sad-jon-snow-game-of-thrones.0.0.jpg",
    "https://cdn.vox-cdn.com/thumbor/IzCqs7vYxwm8aVJvDl69CmkOU1g=/71x0:570x374/1400x1050/filters:focal(71x0:570x374):format(jpeg)/cdn.vox-cdn.com/uploads/chorus_image/image/49958765/kit-harington-sad-jon-snow-game-of-thrones.0.0.jpg",
    "https://cdn.vox-cdn.com/thumbor/IzCqs7vYxwm8aVJvDl69CmkOU1g=/71x0:570x374/1400x1050/filters:focal(71x0:570x374):format(jpeg)/cdn.vox-cdn.com/uploads/chorus_image/image/49958765/kit-harington-sad-jon-snow-game-of-thrones.0.0.jpg",

  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.only(bottom: 60),
          childAspectRatio: 10.0 / 9.0,
          children: images.map((url) {
            return Container(
              margin: EdgeInsets.only(right: 10,bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColor.PRIMARY),

                image: DecorationImage(
                  image: CachedNetworkImageProvider(url),
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
          }).toList(),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 1,
          child: Container(
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: AppColor.PRIMARY,
            ),
            child: Center(
              child: Text(
                'Go live',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
