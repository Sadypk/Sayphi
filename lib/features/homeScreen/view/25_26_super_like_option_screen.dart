import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:sayphi/features/chat_messaging/view/28_sendMessageBottomSheet.dart';
import 'package:sayphi/features/homeScreen/repository/homeRepository.dart';
import 'package:sayphi/features/homeScreen/view/27_send_gift_to_user_sheet.dart';
import 'package:sayphi/mainApp/components/loader.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/user/model/userModel.dart';
import 'package:sayphi/user/repository/userRepo.dart';

class SuperLikeOptionScreen extends StatefulWidget {

  final String userId;

  const SuperLikeOptionScreen({Key? key, required this.userId}) : super(key: key);

  @override
  _SuperLikeOptionScreenState createState() => _SuperLikeOptionScreenState();
}

bool isLiked = false;

class _SuperLikeOptionScreenState extends State<SuperLikeOptionScreen> {

  bool dataLoad = true;
  late UserModel user;

  getData() async{

    user = await HomeRepo.getUserProfile(widget.userId);

    setState(() {
      dataLoad = false;
    });
}

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {

    _buildUserPhotos(){
      return Expanded(
        flex: 89,
        child: Theme(
          data: ThemeData(
            primaryColor: AppColor.PRIMARY
          ),
          child: user.images.length > 0 ? Swiper(
            itemBuilder: (BuildContext context,int index){
              return UserImageView(image: user.images[index].image, id: user.id);
            },
            itemCount: user.images.length,
            pagination: SwiperPagination(),
          ) : UserImageView(image: user.profileImage!, id: user.id),
        ),
      );
    }

    _buildOptions(){
      return Expanded(
        flex: 11,
        child: Padding(
          padding: const EdgeInsets.only(left: 20,top: 12,bottom: 12),
          child: Container(
            height: Get.height * .7,
            child: ListView(
              padding: EdgeInsets.only(bottom: 4),
              scrollDirection: Axis.horizontal,
              children: [

                /// send gift
                CardWrap(
                  onPressed: (){
                    Get.bottomSheet(SendGiftBottomSheet());
                  },
                  child: Icon(
                    CupertinoIcons.gift_fill,
                    color: AppColor.PRIMARY,
                  ),
                ),

                /// send message
                CardWrap(
                  onPressed: (){
                    Get.bottomSheet(ChattingScreen(user: user),isScrollControlled: true);
                  },
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.chat_bubble_2_fill,
                        color: AppColor.PRIMARY,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Send message',
                        style: TextStyle(
                          fontSize: 18
                        ),
                      )
                    ],
                  ),
                ),

                /// challenge
                CardWrap(
                  onPressed: (){},
                  child: Row(
                    children: [
                      Icon(
                        Icons.track_changes,
                        color: AppColor.PRIMARY,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Challenge',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),

                /// video room
                CardWrap(
                  onPressed: (){},
                  child: Row(
                    children: [
                      Icon(
                        Icons.video_collection,
                        color: AppColor.PRIMARY,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Video room',
                        style: TextStyle(
                          fontSize: 18
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      );
    }
    
    return Scaffold(
      backgroundColor: AppColor.SCAFFOLD_BG_PINK,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          dataLoad ? '...' : user.name ?? '_123',
          style: TextStyle(
            color: AppColor.TEXT_COLOR
          ),
        ),
      ),
      body: dataLoad ? Loader() : Column(
        children: [
          _buildUserPhotos(),
          _buildOptions()
        ],
      ),
    );
  }
}

class CardWrap extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  const CardWrap({Key? key, required this.child, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Card(
          margin: EdgeInsets.zero,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Container(
            padding: EdgeInsets.all(8),
            child: Center(child: child)
          )
        ),
      )
    );
  }
}


class UserImageView extends StatefulWidget {
  
  final String image;
  final String id;

  const UserImageView({Key? key,
  required this.image,
  required this.id,
  }) : super(key: key);

  @override
  _UserImageViewState createState() => _UserImageViewState();
}

class _UserImageViewState extends State<UserImageView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: CachedNetworkImageProvider(widget.image),
              fit: BoxFit.cover
            ),
          ),
        ),

        /// options button
        Positioned(
          left: 20,
          child: IconButton(
            onPressed: () async {

              await Get.bottomSheet(Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                  ),
                  color: Colors.white
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.report,
                            size: 18,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Report user'
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    ListTile(
                      onTap: (){
                        UserRepo.blockUnBlockUser(widget.id);
                      },
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.block,
                            size: 18,
                            color: AppColor.PRIMARY,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Block',
                            style: TextStyle(
                              color: AppColor.PRIMARY
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ));

            },
            icon: Icon(
              Icons.more_horiz,
              color: Colors.white,
            ),
          ),
        ),

        Positioned(
          right: 32,
          top: 12,
          child: GestureDetector(
            onTap: (){
              setState(() {
                isLiked = !isLiked;
              });
              UserRepo.followUnFollowUser(widget.id);
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.PRIMARY,
                borderRadius: BorderRadius.circular(12)
              ),
              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.heart,
                    color: Colors.white,
                    size: 16,
                  ),
                  SizedBox(width: 4),
                  Text(
                    isLiked ? 'Follow' : 'UnFollow',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
