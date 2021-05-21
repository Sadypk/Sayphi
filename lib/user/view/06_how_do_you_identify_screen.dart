import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/mainApp/components/cTextFiel.dart';
import 'package:sayphi/mainApp/components/mainButton.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';

class UserGenderSetScreen extends StatefulWidget {
  const UserGenderSetScreen({Key? key}) : super(key: key);

  @override
  _UserGenderSetScreenState createState() => _UserGenderSetScreenState();
}

class _UserGenderSetScreenState extends State<UserGenderSetScreen> {

  String selectedGender = '';
  bool showGenderOnProfile = true;
  bool extraGender = false;

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
              'How do you identify?',
              style: TextStyle(
                fontSize: 20,
                fontFamily: CFontFamily.MEDIUM
              ),
            ),
            SizedBox(height: 12),
            Text(
              'How do you identify on Sayphie',
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
                        extraGender = false;
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
                        extraGender = false;
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
            SizedBox(height: 12),

            /// Other genders bottom sheet
            Center(
              child: extraGender ? Padding(
                padding: EdgeInsets.only(top: 12),
                child: GestureDetector(
                  onTap: _buildOtherGenders,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: AppColor.PRIMARY
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.PRIMARY.withOpacity(.1),
                          spreadRadius: 5,
                          blurRadius: 7
                        )
                      ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          selectedGender,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: CFontFamily.REGULAR
                          ),
                        ),
                        SizedBox(width: 12),
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        )
                      ],
                    ),
                  ),
                ),
              ) : TextButton(
                onPressed: _buildOtherGenders,
                child: Text(
                  'Another gender',
                  style: TextStyle(
                    color: AppColor.PRIMARY,
                    fontSize: 16
                  ),
                ),
              ),
            ),

            /// when a gender is selected show showing profile view options
            AnimatedCrossFade(
              firstChild: SizedBox(),
              secondChild: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Show my gender info on profile?',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: CFontFamily.MEDIUM
                    ),
                  ),
                  CheckboxListTile(
                      dense: true,
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      value: showGenderOnProfile,
                      activeColor: AppColor.PRIMARY,
                      onChanged: (value) => setState(() => showGenderOnProfile = value!),
                      title: Text(
                          'Show gender info',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: CFontFamily.REGULAR
                          )
                      )
                  ),
                  SizedBox(height: 20)
                ],

              ),
              crossFadeState: selectedGender == '' ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: Duration(milliseconds: 400)
            ),

            SizedBox(height: 20),
            MainButton(onPress: (){}, label: 'Continue')
          ],
        ),
      ),
    );
  }

  void _buildOtherGenders() {
    Get.bottomSheet(Container(
      height: Get.height * .8,
      margin: EdgeInsets.only(top: Get.height * .2),
      decoration: BoxDecoration(
          color: AppColor.SCAFFOLD_BG_PINK,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )
      ),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(

          children: [
            AppBar(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CTextField(
                hintText: 'Search',
              ),
            ),

            SizedBox(
              height: Get.height * .65,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 12),
                itemCount: 200,
                itemBuilder: (_, index) => InkWell(
                  onTap: (){
                    setState(() {
                      selectedGender = 'Gender  $index';
                      extraGender = true;
                    });
                    Get.back();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Gender  $index',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: CFontFamily.REGULAR
                      ),
                    ),
                  ),
                ),
              ),
            )


          ],
        ),
      ),
    ),isScrollControlled: true);
  }
}

class GenderBox extends StatelessWidget {
  final String label;
  final bool isSelected;

  const GenderBox({Key? key, required this.label, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: isSelected ? AppColor.PRIMARY : Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isSelected ? AppColor.PRIMARY : AppColor.BORDER_COLOR,
        )
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontFamily: CFontFamily.REGULAR,
            color: isSelected ? Colors.white : AppColor.TEXT_COLOR
          ),
        ),
      ),
    );
  }
}
