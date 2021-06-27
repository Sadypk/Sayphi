import 'package:flutter/material.dart';
import 'package:sayphi/features/live/view/widgets/create_audio_room_add_people_list.dart';
import 'package:sayphi/mainApp/components/mainButton.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';

class CreateAudioRoomScreen extends StatefulWidget {
  const CreateAudioRoomScreen({Key? key}) : super(key: key);

  @override
  _CreateAudioRoomScreenState createState() => _CreateAudioRoomScreenState();
}

class _CreateAudioRoomScreenState extends State<CreateAudioRoomScreen> {
  @override
  Widget build(BuildContext context) {

    _buildRoomNameAndTopics(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Room name',
            style: TextStyle(fontSize: 16, fontFamily: CFontFamily.MEDIUM),
          ),
          SizedBox(
            height: 3,
          ),
          Container(
            height: 45,
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.PRIMARY),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.PRIMARY),
                  ),
                  hintText: 'e.g: My room',
                  // hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey)
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Text(
            'Topics',
            style: TextStyle(fontSize: 16, fontFamily: CFontFamily.MEDIUM),
          ),
          SizedBox(
            height: 3,
          ),
          Container(
            height: 45,
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.PRIMARY),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.PRIMARY),
                  ),
                  hintText: 'e.g: UI/UX Design',
                  // hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey)
              ),
            ),
          ),
        ],
      );
    }

    _buildPeopleList(){
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 18,
            ),
            Text(
              'New matches',
              style: TextStyle(fontSize: 16, fontFamily: CFontFamily.MEDIUM),
            ),
            SizedBox(
              height: 10,
            ),
            AddPeople(),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Create new room',
          style: TextStyle(
            fontSize: 16,
            fontFamily: CFontFamily.REGULAR,
            color: AppColor.TEXT_COLOR
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRoomNameAndTopics(),

            _buildPeopleList(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: MainButton(
          onPress: (){},
          label: 'Start stream',
        ),
      ),
    );
  }
}
