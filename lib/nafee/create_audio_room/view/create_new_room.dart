import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/nafee/create_audio_room/view_model/add_people.dart';

class CreateNewRoom extends StatelessWidget {
  final TextEditingController roomNameController = TextEditingController();
  final TextEditingController topicsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        primary: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 3), child: Icon(Icons.arrow_back_ios, color: Colors.grey)),
                  Text(
                    'Create new room',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Room name',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    height: 45,
                    child: TextFormField(
                      controller: roomNameController,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColor.PRIMARY),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColor.PRIMARY),
                          ),
                          hintText: 'e.g: My room',
                          hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Topics',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    height: 45,
                    child: TextFormField(
                      controller: topicsController,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColor.PRIMARY),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColor.PRIMARY),
                          ),
                          hintText: 'e.g: UI/UX Design',
                          hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'New matches',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AddPeople(),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: AppColor.PRIMARY,
                    ),
                    child: Center(
                      child: Text(
                        'Start stream',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
