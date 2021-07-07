import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/features/chat_messaging/model/messagModel.dart';
import 'package:sayphi/features/chat_messaging/repository/chatRepo.dart';
import 'package:sayphi/features/chat_messaging/view_model/chatViewModel.dart';
import 'package:sayphi/features/homeScreen/model/matchedUserModel.dart';
import 'package:sayphi/features/homeScreen/repository/homeRepository.dart';
import 'package:sayphi/mainApp/components/loader.dart';
import 'package:sayphi/mainApp/model/otherUserModel.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/features/chat_messaging/view/widgets/chat_head.dart';
import 'widgets/messageListView.dart';

class ChatMainScreen extends StatefulWidget {

  static RxString searchText = ''.obs;
  static void onChanged(String value) => searchText.value = value;

  @override
  _ChatMainScreenState createState() => _ChatMainScreenState();
}

class _ChatMainScreenState extends State<ChatMainScreen> {
  @override
  void initState() {
    super.initState();
    ChatMainScreen.searchText.value = '';
    ChatRepo.init();
  }

  @override
  Widget build(BuildContext context) {


    _buildSearchMatchesTextField(){
      return Container(
        height: 45,
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.grey),
          color: Colors.grey.withOpacity(0.1),
        ),
        child: Row(
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 5), child: Icon(Icons.search, color: Colors.grey)),
            Flexible(
              child: TextField(
                onChanged: ChatMainScreen.onChanged,
                decoration: InputDecoration.collapsed(
                    hintText: 'Search matches', hintStyle: TextStyle(fontSize: 16, fontFamily: CFontFamily.REGULAR, color: AppColor.DARK_GREY)),
              ),
            )
          ],
        ),
      );
    }

    _buildNewMatches(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 20),
            child: Text(
              'New matches',
              style: TextStyle(
                fontSize: 16,
                fontFamily: CFontFamily.REGULAR
              ),
            ),
          ),
          Container(
            height: 60,
            child: FutureBuilder(
              future: HomeRepo.getMatchedUsers(),
              builder: (_ ,AsyncSnapshot<List<MinimalUserModel>> snapshot){
                if(snapshot.hasData && snapshot.data != null){
                  return snapshot.data!.length > 0 ? ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 20),
                    itemCount: snapshot.data!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return ChatHeader(minUser: snapshot.data![index]);
                    },
                  ) : Center(child: Text('None found'));
                }else{
                  return Loader();
                }
              },
            ),
          ),
        ],
      );
    }

    _buildChatList(){
      return Expanded(
        child: DefaultTabController(
          length: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 8,left: 20,right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBar(
                  labelColor: AppColor.TEXT_COLOR,
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontFamily: CFontFamily.REGULAR
                  ),
                  indicatorColor: AppColor.PRIMARY,
                  indicatorWeight: 4,
                  tabs: [
                    Tab(
                      text: 'New Messages',
                    ),
                    Tab(
                      text: 'All Messages',
                    ),
                  ]
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Obx((){

                        List<List<MessageModel>> listMessages = [];

                        List<String> toUserIDs = [];

                        ChatViewModel.allChat.forEach((element) {

                          if(!toUserIDs.contains(element.toUserId)){
                            toUserIDs.add(element.toUserId);
                          }

                        });

                        toUserIDs.forEach((element) {
                          listMessages.add(ChatViewModel.allChat.where((message) => message.toUserId == element).toList());
                        });


                        listMessages.sort((a,b) => a.last.createdAt.compareTo(b.last.createdAt));

                        return MessageListView(messageList: listMessages);

                      }),
                      Obx((){

                        List<List<MessageModel>> listMessages = [];

                        List<String> toUserIDs = [];

                        ChatViewModel.allChat.forEach((element) {

                          if(!toUserIDs.contains(element.toUserId)){
                            toUserIDs.add(element.toUserId);
                          }

                        });

                        toUserIDs.forEach((element) {
                          listMessages.add(ChatViewModel.allChat.where((message) => message.toUserId == element).toList());
                        });

                        return MessageListView(messageList: listMessages);

                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(height: 12),

        // _buildSearchMatchesTextField(),

        _buildNewMatches(),

        _buildChatList(),

      ],
    );
  }
}
