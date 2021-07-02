import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/demo_files.dart';
import 'package:sayphi/features/dayStory/repository/dayStoryRepo.dart';
import 'package:sayphi/features/dayStory/view/wdigets/homeScreenDayBar.dart';
import 'package:sayphi/features/homeScreen/view/widgets/circularBtn.dart';
import 'package:sayphi/mainApp/components/loader.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/appImages.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:tcard/tcard.dart';

import '25_26_super_like_option_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TCardController _controller = TCardController();

  bool showStory = true;

  bool pageLoad = true;

  getData()async{
    await DayStoryRepo.init();
    setState(() {
      pageLoad = false;
    });
  }

  @override
  void initState() {
    if(mounted){
      super.initState();
      getData();
    }else{
      return ;
    }
  }

  @override
  Widget build(BuildContext context) {

    /// main swiper widget
    _buildCards(){
      return SizedBox(
        height: Get.height * .5,
        child: RotatedBox(
          quarterTurns: 2,
          child: TCard(
            controller: _controller,
            cards: Demo.DEMO_USERS.map((e) => UserSwiperCard(
              image: e,
            )).toList(),
            onForward: (index, info){
              setState(() {});
              print(info.direction);
              print(info.cardIndex);
            },
            onBack: (index, info){
              setState(() {});
              print(info.direction);
              print(info.cardIndex);
            },
            onEnd: (){
              setState(() {});
              _controller.reset();
            },
          ),
        ),
      );
    }

    /// showing the front up users info
    _buildUserInfo(bool isUserLive){
      return Padding(
        padding : EdgeInsets.only(bottom: 12, left: 20, right: 20,top: 4),
        child: GestureDetector(
          onVerticalDragStart: (drag){
            setState(() {
              showStory = !showStory;
            });
          },
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0,2),
                  blurRadius: 1,
                  spreadRadius: 1,
                  color: AppColor.PRIMARY.withOpacity(.1)
                )
              ]
            ),
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// is user live ?
                      if(isUserLive)Row(
                        children: [
                          Icon(
                            Icons.surround_sound,
                            color: AppColor.PRIMARY,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Live now',
                            style: TextStyle(
                              fontFamily: CFontFamily.MEDIUM,
                              color: AppColor.PRIMARY
                            ),
                          )
                        ],
                      ),

                      /// user name
                      Text(
                        'User name ${_controller.index}',
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: CFontFamily.BOLD,
                        ),
                      ),

                      /// user location
                      Text(
                        'Las Vegas, CA',
                        style: TextStyle(
                          fontFamily: CFontFamily.REGULAR,
                          color: AppColor.TEXT_LIGHT
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      /// VIP points
                      Stack(
                        children: [
                          Image.asset(
                            Images.ICON_HEXAGON,
                            height: 54,
                            width: 48,
                          ),
                          Positioned.fill(
                            child: Center(
                              child: Text(
                                '${_controller.index * 12}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: CFontFamily.MEDIUM
                                ),
                              ),
                            ),
                          )
                        ],
                      ),

                      /// distance
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.location_fill,
                            color: AppColor.PRIMARY,
                            size: 14,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '${_controller.index * 7} Km',
                            style: TextStyle(
                              color: AppColor.PRIMARY,
                              fontFamily: CFontFamily.REGULAR
                            ),
                          )
                        ],
                      )

                    ],
                  )
                )
              ],
            ),
          ),
        ),
      );
    }

    /// users bluh
    _buildUserBluh(){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
        child: Stack(
          children: [
            Container(
              height: Get.height * .12,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColor.PRIMARY.withOpacity(.2)
              ),
              padding: EdgeInsets.only(top: 16,left: 42, right: 8),
              child: Text(
                'Katerina is an American singer and actress. She also loves to travel..',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: CFontFamily.REGULAR
                ),
              ),
            ),

            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                Images.ICON_QUOTE,
                height: 32,
                width: 36,
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: pageLoad ? Loader() : CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate([
            HomeScreenDayBar(),
            _buildCards(),
            _buildUserInfo(true),
            _buildUserBluh()
          ]))
        ],
      ),
    );
  }
}


class UserSwiperCard extends StatelessWidget {
  final String image;
  const UserSwiperCard({Key? key,
    required this.image
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// user image
        RotatedBox(
          quarterTurns: 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: CachedNetworkImageProvider(image),
                fit: BoxFit.cover
              )
            ),
          ),
        ),

        /// main buttons
        Positioned(
          top: 12,
          left: 0,
          right: 0,
          child: RotatedBox(
            quarterTurns: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CIconButton(
                  onTap: (){},
                  icon: Icons.refresh,
                  iconColor: Color(0xffF7BF60)
                ),
                CIconButton(
                  onTap: (){},
                  icon: Icons.close,
                  iconColor: Color(0xffA36CF9)
                ),
                CIconButton(
                  onTap: (){},
                  icon: Icons.thumb_up_sharp,
                  iconColor: Color(0xff7920FF)
                ),

                /// super like btn
                CIconButton(
                  onTap: (){
                    Get.to(() => SuperLikeOptionScreen());
                  },
                  icon: Icons.emoji_emotions,
                  iconColor: Color(0xff00DC84)
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}