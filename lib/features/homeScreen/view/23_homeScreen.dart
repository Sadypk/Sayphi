import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:sayphi/demo_files.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/appConst.dart';
import 'package:sayphi/mainApp/resources/appImages.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:tcard/tcard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TCardController _controller = TCardController();

  bool showStory = false;

  @override
  Widget build(BuildContext context) {

    _buildAppBar() {
      return AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
              Demo.PROFILE_IMAGE
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: (){_controller.reset();},
              icon: Icon(
                Icons.more_horiz,
                color: AppColor.DARK_GREY,
              ),
            )
          )
        ],
      );
    }

    /// friends stories
    _buildStoryPart(){
      return Container(
        height: 80,
        margin: EdgeInsets.only(left: 20, right: 20, top: 12),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: Demo.DEMO_USERS.length,
          itemBuilder: (_, index) => UserDayAvatar(
              imageLink: Demo.DEMO_USERS[index],
              name: 'user_$index',
              isOwn: index == 0
          ),
        ),
      );
    }

    /// main swiper widget
    _buildCards(){
      return Expanded(
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
    _buildCardInfo(bool isUserLive){
      return Padding(
        padding : EdgeInsets.only(bottom: 26, left: 20, right: 20,top: 4),
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

    return Container(
      color: Color(0xffFDE6EF).withOpacity(.4),
      child: Column(
        children: [
          _buildAppBar(),

          AnimatedCrossFade(
            firstChild: _buildStoryPart(),
            secondChild: SizedBox(),
            crossFadeState: showStory ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: AppConst.DURATION_FAST
          ),

          _buildCards(),

          _buildCardInfo(true),
        ],
      ),
    );
  }
}

class UserDayAvatar extends StatelessWidget {
  final String imageLink;
  final String name;
  final bool isOwn;
  final bool isWatched;
  final bool userOnline;


  const UserDayAvatar({Key? key,
  required this.imageLink,
  required this.name,
  this.isOwn = false,
  this.isWatched = false,
  this.userOnline = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Stack(
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 27,
                backgroundColor: isWatched ? Colors.transparent : AppColor.PRIMARY,
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: CachedNetworkImageProvider(imageLink),
                ),
              ),
              SizedBox(height: 8),
              Text(
                isOwn ? 'Your Story' : name
              )
            ],
          ),
          if(isOwn)Positioned(
            bottom: 20,
            right: 0,
            child: Icon(
              Icons.add_circle_rounded,
              color: AppColor.PRIMARY,
              size: 20,
            ),
          )
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
                CIconButton(
                  onTap: (){},
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

class CIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;
  const CIconButton({Key? key,
    required this.onTap,
    required this.icon,
    required this.iconColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: 48,
      circleColor: CircleColor(start: iconColor, end: iconColor),
      bubblesColor: BubblesColor(
        dotPrimaryColor: iconColor,
        dotSecondaryColor: iconColor
      ),
      likeBuilder: (_) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle
        ),
        child: Icon(
            icon,
            color: iconColor
        ),
      )
    );
  }
}
