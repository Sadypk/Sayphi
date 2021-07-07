import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/features/dayStory/repository/dayStoryRepo.dart';
import 'package:sayphi/features/dayStory/view/wdigets/homeScreenDayBar.dart';
import 'package:sayphi/features/homeScreen/model/matchedUserModel.dart';
import 'package:sayphi/features/homeScreen/repository/homeRepository.dart';
import 'package:sayphi/features/homeScreen/view/widgets/circularBtn.dart';
import 'package:sayphi/features/homeScreen/viewModel/homeViewModel.dart';
import 'package:sayphi/mainApp/components/loader.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/appImages.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/user/repository/userRepo.dart';
import 'package:tcard/tcard.dart';

import '25_26_super_like_option_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

final TCardController _controller = TCardController();

class _HomeScreenState extends State<HomeScreen> {


  bool pageLoad = true;

  getData()async{
    setState(() {
      pageLoad = true;
    });
    await DayStoryRepo.init();
    HomeViewModel.addData(await HomeRepo.getMatchingUsers());
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

  processSwipe(int index, SwipInfo info){
    final user = HomeViewModel.matchedUserList[_controller.index];
    if(info.direction == SwipDirection.Right){
      HomeRepo.matchUnMatchUser(user.id, false);
    }else if(info.direction == SwipDirection.Left){
      HomeRepo.matchUnMatchUser(user.id, true);
    }
  }


  @override
  Widget build(BuildContext context) {


    /// main swiper widget
    _buildCards(){
      return Column(
        children: [
          SizedBox(
            height: Get.height * .5,
            child: HomeViewModel.matchedUserList.length > 0 ? RotatedBox(
              quarterTurns: 2,
              child: TCard(
                controller: _controller,
                cards: HomeViewModel.matchedUserList.map((matchedUser) => UserSwiperCard(matchedUser: matchedUser)).toList(),
                onForward: processSwipe,
                onBack: processSwipe,
                onEnd: (){
                  _controller.reset();
                },
              ),
            ) : Center(child: Text('No matching user found'))
          ),

          if(HomeViewModel.matchedUserList.length > 0 ) Padding(
            padding : EdgeInsets.only(bottom: 12, left: 20, right: 20,top: 4),
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
                    flex: 75,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// is user live ?
                        if(true)Row(
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
                          HomeViewModel.matchedUserList[_controller.index].name,
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: CFontFamily.BOLD,
                          ),
                        ),

                        /// user location
                        Text(
                          HomeViewModel.matchedUserList[_controller.index].address,
                          style: TextStyle(
                              fontFamily: CFontFamily.REGULAR,
                              color: AppColor.TEXT_LIGHT
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                      flex: 25,
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
                                    '${HomeViewModel.matchedUserList[_controller.index].rank}',
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
                                '${HomeViewModel.matchedUserList[_controller.index].distance} Km',
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
          )
        ],
      );
    }
    /// users bluh
    _buildUserBluh(){
      return HomeViewModel.matchedUserList.length > 0 ? Padding(
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
                '${HomeViewModel.matchedUserList[_controller.index].name} is an American singer and actress. She also loves to travel..',
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
      ) : SizedBox();
    }

    return Scaffold(
      body: pageLoad ? Loader() : Obx(()=>CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate([
            HomeScreenDayBar(),
            _buildCards(),
            _buildUserBluh()
          ]))
        ],
      )),
    );
  }
}


class UserSwiperCard extends StatelessWidget {
  final MinimalUserModel matchedUser;
  const UserSwiperCard({Key? key,
    required this.matchedUser
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
                image: CachedNetworkImageProvider(matchedUser.image),
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
                  onTap: (){
                    _controller..forward(direction: SwipDirection.Right);
                  },
                  icon: Icons.refresh,
                  iconColor: Color(0xffF7BF60)
                ),
                CIconButton(
                  onTap: () {
                    _controller..forward(direction: SwipDirection.Right);
                    HomeRepo.matchUnMatchUser(matchedUser.id, false);
                  },
                  icon: Icons.close,
                  iconColor: Color(0xffA36CF9)
                ),


                CIconButton(
                  onTap: () => UserRepo.likeUnLikeUser(matchedUser.id),
                  icon: Icons.thumb_up_sharp,
                  iconColor: Color(0xff7920FF)
                ),

                /// super like btn
                CIconButton(
                  onTap: (){
                    Get.to(() => SuperLikeOptionScreen(userId: matchedUser.id));
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