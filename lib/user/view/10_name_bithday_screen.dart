import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sayphi/mainApp/components/mainButton.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/user/view/11_12_13_upload_pics_screen.dart';


class NameAndBirthdayScreen extends StatelessWidget {
  const NameAndBirthdayScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final birthdayController = TextEditingController();

    _buildName(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What is your name?',
            style: TextStyle(
                fontSize: 20,
                fontFamily: CFontFamily.MEDIUM
            ),
          ),
          SizedBox(height: 12),
          Text(
            'This is how you will appear on your Sayphie profile',
            style: TextStyle(
                fontFamily: CFontFamily.REGULAR
            ),
          ),
          SizedBox(height: 20),
          /// name input text field
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: AppColor.PRIMARY)
                )
            ),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none
                  )
              ),
            ),
          )
        ],
      );
    }

    _buildBirthday(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'When is your birthday?',
            style: TextStyle(
                fontSize: 20,
                fontFamily: CFontFamily.MEDIUM
            ),
          ),
          SizedBox(height: 12),
          Text(
            'We need your birthday to make sure you are over 18',
            style: TextStyle(
                fontFamily: CFontFamily.REGULAR
            ),
          ),
          SizedBox(height: 20),
          /// choose birthday field
          GestureDetector(
            onTap: () async {
              DateTime? newDateTime = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1990),
                lastDate: DateTime(2200),
                builder: (_, child) => Theme(
                  data: ThemeData(
                    primaryColor: AppColor.PRIMARY,
                    accentColor: AppColor.PRIMARY,
                    colorScheme: ColorScheme.light(
                      primary: AppColor.PRIMARY,
                      surface: AppColor.PRIMARY,
                      onSurface: AppColor.PRIMARY
                    )
                  ),
                  child: child!,
                )
              );
              if(newDateTime != null){
                birthdayController.text = DateFormat().add_yMMMMEEEEd().format(newDateTime);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: AppColor.PRIMARY)
                  )
              ),
              child: TextField(
                enabled: false,
                controller: birthdayController,
                decoration: InputDecoration(
                    hintText: 'Choose your birthday',
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none
                    )
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: AppColor.SCAFFOLD_BG_PINK,
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildName(),

            Divider(
              color: AppColor.BORDER_COLOR,
              height: 100,
            ),

            _buildBirthday(),

            SizedBox(height: 20),
            MainButton(onPress: (){
              Get.to(()=> UploadPhotoViewScreen());
            }, label: 'Continue')
          ],
        ),
      ),
    );
  }
}
