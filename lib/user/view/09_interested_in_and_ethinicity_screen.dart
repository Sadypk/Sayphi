import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/mainApp/components/loader.dart';
import 'package:sayphi/mainApp/components/mainButton.dart';
import 'package:sayphi/mainApp/helpers/snack.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/user/model/ethnicityModel.dart';
import 'package:sayphi/user/repository/getBasicData.dart';
import 'package:sayphi/user/repository/userRepo.dart';
import './widgets/genderBox.dart';
import '10_name_bithday_screen.dart';

class InterestedInAndEthnicityChooseScreen extends StatefulWidget {
  const InterestedInAndEthnicityChooseScreen({Key? key}) : super(key: key);

  @override
  _InterestedInAndEthnicityChooseScreenState createState() => _InterestedInAndEthnicityChooseScreenState();
}

class _InterestedInAndEthnicityChooseScreenState extends State<InterestedInAndEthnicityChooseScreen> {

  List<EthnicityModel>? ethnicities;

  String? interestedGender;
  EthnicityModel? userEthnicity;

  @override
  Widget build(BuildContext context) {


    _buildInterestedIn(){
      return StatefulBuilder(builder: (BuildContext context, void Function(void Function()) __setState) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Interested in?',
            style: TextStyle(
                fontSize: 20,
                fontFamily: CFontFamily.MEDIUM
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Which user you want to show on your Sayphie profile',
            style: TextStyle(
                fontFamily: CFontFamily.REGULAR
            ),
          ),
          SizedBox(height: 20),

          /// male female cards
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    __setState(() {
                      interestedGender = 'male';
                    });
                  },
                  child: GenderBox(
                    isSelected: interestedGender == 'male',
                    label: 'Male',
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    __setState(() {
                      interestedGender = 'female';
                    });
                  },
                  child: GenderBox(
                    isSelected: interestedGender == 'female',
                    label: 'Female',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          MainButton(
            onPress: (){
              __setState(() {
                interestedGender = 'both';
              });
            },
            btnColor: interestedGender == 'both' ? null : Colors.white,
            label: 'Both',
            trailingIcon: interestedGender == 'both' ? Icons.check_circle : null,
          )
        ],
      ));
    }

    _buildEthnicity(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What is your ethnicity?',
            style: TextStyle(
                fontSize: 20,
                fontFamily: CFontFamily.MEDIUM
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Select your ethnicity from the list below',
            style: TextStyle(
                fontFamily: CFontFamily.REGULAR
            ),
          ),
          SizedBox(height: 20),
          FutureBuilder(
            future: BasicDataRepo.getAllEthnicity(),
            initialData: ethnicities,
            builder: (_, AsyncSnapshot<List<EthnicityModel>> snapshot){
              if(snapshot.hasData && snapshot.data != null){
                ethnicities = snapshot.data;
                return StatefulBuilder(builder: (BuildContext context, void Function(void Function()) _setState) => DropdownButton<EthnicityModel>(
                    underline: Container(
                      height: 2,
                      color: AppColor.PRIMARY,
                    ),
                    isExpanded: true,
                    hint: Text(
                        'Please select'
                    ),
                    value: userEthnicity,
                    onChanged: (value) => _setState(() => userEthnicity = value!),
                    items: snapshot.data!.map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                          e.ethnicity
                      ),
                    )).toList()
                ));
              }else{
                return Loader();
              }
            },
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

            _buildInterestedIn(),

            Divider(
              color: AppColor.BORDER_COLOR,
              height: 100,
            ),

            _buildEthnicity(),

            SizedBox(height: 20),
            MainButton(
              onPress: (){

                if(interestedGender != null && userEthnicity != null){

                  UserRepo.updateProfile(
                    interestedIn: interestedGender,
                    ethnicityId: userEthnicity!.id
                  );

                  Get.off(()=> NameAndBirthdayScreen());
                }else{
                  Snack.top(
                    message: 'Please choose the options to continue'
                  );
                }
              },
              label: 'Continue',
            )
          ],
        ),
      ),
    );
  }
}
