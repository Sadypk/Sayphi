import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/components/mainButton.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import './widgets/genderBox.dart';

class InterestedInAndEthnicityChooseScreen extends StatefulWidget {
  const InterestedInAndEthnicityChooseScreen({Key? key}) : super(key: key);

  @override
  _InterestedInAndEthnicityChooseScreenState createState() => _InterestedInAndEthnicityChooseScreenState();
}

class _InterestedInAndEthnicityChooseScreenState extends State<InterestedInAndEthnicityChooseScreen> {

  List<String> ethnicities = [];

  String selectedGender = '';
  String? selectedEthnicity;

  @override
  void initState() {
    super.initState();
    ethnicities = List.generate(100, (index) => 'Ethnicities $index');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.SCAFFOLD_BG_PINK,
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: (){},
              child: Text(
                'Skip',
                style: TextStyle(
                    color: AppColor.TEXT_COLOR
                ),
              )
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
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
                      setState(() {
                        selectedGender = 'male';
                      });
                    },
                    child: GenderBox(
                      isSelected: selectedGender == 'male',
                      label: 'Male',
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender = 'female';
                      });
                    },
                    child: GenderBox(
                      isSelected: selectedGender == 'female',
                      label: 'Female',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            MainButton(
              onPress: (){
                setState(() {
                  selectedGender = 'both';
                });
              },
              btnColor: selectedGender == 'both' ? null : Colors.white,
              label: 'Both',
              trailingIcon: selectedGender == 'both' ? Icons.check_circle : null,
            ),

            Divider(
              color: AppColor.BORDER_COLOR,
              height: 100,
            ),

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
            DropdownButton<String>(
              underline: Container(
                height: 2,
                color: AppColor.PRIMARY,
              ),
              isExpanded: true,
              hint: Text(
                'Please select'
              ),
              value: selectedEthnicity,
              onChanged: (value) => setState(() => selectedEthnicity = value!),
              items: ethnicities.map((e) => DropdownMenuItem(
                value: e,
                child: Text(
                  e
                ),
              )).toList()
            ),
            SizedBox(height: 20),
            MainButton(
              onPress: (){},
              label: 'Continue',
            )
          ],
        ),
      ),
    );
  }
}
