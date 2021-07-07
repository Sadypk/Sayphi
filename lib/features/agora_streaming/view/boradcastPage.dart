import 'dart:math';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/features/chat_messaging/model/messagModel.dart';
import 'package:sayphi/features/live/repository/videoLiveRepo.dart';
import 'package:sayphi/mainApp/config/graphql/apiConfig.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/mainApp/util/env.dart';
import 'package:sayphi/user/view_model/userViewModel.dart';

class BroadcastPage extends StatefulWidget {
  final bool isBroadcaster;
  final String streamToken;
  final String channelName;
  final bool isVideo;

  BroadcastPage({
    required this.streamToken,
    required this.channelName,
    required this.isBroadcaster,
    required this.isVideo
  });


  static RxList<MessageModel> chat = <MessageModel>[].obs;
  static RxInt viewer = 0.obs;

  @override
  _BroadcastPageState createState() => _BroadcastPageState();
}

class _BroadcastPageState extends State<BroadcastPage> {
  final _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();
  final _users = <int>[];
  late RtcEngine _engine;
  bool muted = false;

  @override
  void dispose() {
    // clear users
    _users.clear();
    // destroy sdk and leave channel
    _engine.destroy();

    LiveRepo.closeChannel(widget.isVideo);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initializeAgora();
    if(widget.isBroadcaster){
      LiveRepo.createChat(widget.channelName);
    }else{
      LiveRepo.increaseViewCount(widget.channelName);
    }
    LiveRepo.getLiveVideoChat(widget.channelName);
  }



  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  Future<void> initializeAgora() async {
    await _initAgoraRtcEngine();

    _engine.setEventHandler(RtcEngineEventHandler(
      joinChannelSuccess: (channel, uid, elapsed) {
        setState(() {
          print('onJoinChannel: $channel, uid: $uid');
        });
      },
      leaveChannel: (stats) {
        setState(() {
          print('onLeaveChannel');
          _users.clear();
        });
      },
      userJoined: (uid, elapsed) {
        setState(() {
          print('userJoined: $uid');

          _users.add(uid);
        });
      },
      userOffline: (uid, elapsed) {
        setState(() {
          print('userOffline: $uid');
          _users.remove(uid);
        });
      },
    ));

    await _engine.joinChannelWithUserAccount(widget.streamToken, widget.channelName, UserViewModel.user.value.id);
  }


  Future<void> _initAgoraRtcEngine() async {
    _engine = await RtcEngine.createWithConfig(RtcEngineConfig(Env.agoraID));
    await _engine.enableVideo();

    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    if (widget.isBroadcaster) {
      await _engine.setClientRole(ClientRole.Broadcaster);
    } else {
      await _engine.setClientRole(ClientRole.Audience);
    }
  }

  final _controller = TextEditingController();
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    _buildUserInfo() => SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Get.width * .5,
            height: 50,
            margin: EdgeInsets.only(left: 20,top: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(.3)
            ),
            child: Row(
              children: [

                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(UserViewModel.user.value.profileImage!),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                ),
                SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        UserViewModel.user.value.name!,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: CFontFamily.MEDIUM
                        ),
                      ),
                      Text(
                        UserViewModel.user.value.userLocation == null ? '' : UserViewModel.user.value.userLocation!.name,
                        maxLines: 1,
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
          SizedBox(height: 12),
          Obx(()=>Container(
            margin: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColor.PRIMARY
            ),
            padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.remove_red_eye,
                  color: Colors.white,
                  size: 20,
                ),
                Text(
                  ' ' + BroadcastPage.viewer.value.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );

    _buildChat() => Positioned(
      bottom: 120,
      left: 20,
      right: 20,
      child: Obx((){
        _scrollController.animateTo(
          0.0,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 300),
        );
        return Container(
          height: Get.height * .3,
          child: ListView.builder(
            controller: _scrollController,
            shrinkWrap: true,
            itemCount: BroadcastPage.chat.length,
            itemBuilder: (_, index) {
              final chat = BroadcastPage.chat[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(chat.toUserImage),
                ),
                title: Text(
                    chat.fromUser
                ),
                subtitle: Text(
                    chat.message
                ),
              );
            },
          ),
        );
      })
    );

    sendMessageBar() => Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.all(20),
        child: TextField(
          controller: _controller,
          onSubmitted: (msg) {
            LiveRepo.sendMessage(widget.channelName, msg);
            _controller.clear();
          },
          decoration: InputDecoration(
            hintText: 'Write your message'
          ),
        ),
      ),
    );


    _audioView() => Container(
      child: Column(
        children: [
          Icon(
            Icons.audiotrack,
            size: 32,
            color: AppColor.PRIMARY,
          ),
          SizedBox(height: 20),
          Text(
            'Audio Only',
            style: TextStyle(
              fontSize: 32,
              fontFamily: CFontFamily.MEDIUM
            ),
          )
        ],
      )
    );


    return Obx(()=>Scaffold(
      body: !Api.apiLoading.value?Center(
        child: Stack(
          children: <Widget>[
            SizedBox(width: double.infinity),
            widget.isVideo ? _broadcastView() : _audioView(),
            widget.isBroadcaster ? _toolbar() : sendMessageBar(),
            _buildUserInfo(),
            _buildChat(),
          ],
        ),
      ):SizedBox(),
    ));
  }

  Widget _toolbar() {
    return widget.isBroadcaster
        ? Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.symmetric(vertical: 48),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RawMaterialButton(
                  onPressed: _onToggleMute,
                  child: Icon(
                    muted ? Icons.mic_off : Icons.mic,
                    color: muted ? Colors.white : Colors.blueAccent,
                    size: 20.0,
                  ),
                  shape: CircleBorder(),
                  elevation: 2.0,
                  fillColor: muted ? Colors.blueAccent : Colors.white,
                  padding: const EdgeInsets.all(12.0),
                ),
                RawMaterialButton(
                  onPressed: () => _onCallEnd(context),
                  child: Icon(
                    Icons.call_end,
                    color: Colors.white,
                    size: 35.0,
                  ),
                  shape: CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.redAccent,
                  padding: const EdgeInsets.all(15.0),
                ),
                RawMaterialButton(
                  onPressed: _onSwitchCamera,
                  child: Icon(
                    Icons.switch_camera,
                    color: Colors.blueAccent,
                    size: 20.0,
                  ),
                  shape: CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  padding: const EdgeInsets.all(12.0),
                ),
              ],
            ),
          )
        : Container();
  }

  /// Helper function to get list of native views
  List<Widget> _getRenderViews() {
    final List<StatefulWidget> list = [];
    if (widget.isBroadcaster) {
      list.add(RtcLocalView.SurfaceView());
    }
    _users.forEach((int uid) => list.add(RtcRemoteView.SurfaceView(uid: uid)));
    return list;
  }

  /// Video view row wrapper
  Widget _expandedVideoView(List<Widget> views) {
    final wrappedViews = views
        .map<Widget>((view) => Expanded(child: Container(child: view)))
        .toList();
    return Expanded(
      child: Row(
        children: wrappedViews,
      ),
    );
  }

  /// Video layout wrapper
  Widget _broadcastView() {
    final views = _getRenderViews();
    switch (views.length) {
      case 1:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoView([views[0]])
          ],
        ));
      case 2:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoView([views[0]]),
            _expandedVideoView([views[1]])
          ],
        ));
      case 3:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoView(views.sublist(0, 2)),
            _expandedVideoView(views.sublist(2, 3))
          ],
        ));
      case 4:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoView(views.sublist(0, 2)),
            _expandedVideoView(views.sublist(2, 4))
          ],
        ));
      default:
    }
    return Container();
  }

  void _onCallEnd(BuildContext context) {
    Navigator.pop(context);
  }

  void _onToggleMute() {
    setState(() {
      muted = !muted;
    });
    _engine.muteLocalAudioStream(muted);
  }

  void _onSwitchCamera() {
    _engine.switchCamera();
  }
}
