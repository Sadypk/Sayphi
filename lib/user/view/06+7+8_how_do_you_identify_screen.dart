import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/mainApp/components/cTextFiel.dart';
import 'package:sayphi/mainApp/components/loader.dart';
import 'package:sayphi/mainApp/components/mainButton.dart';
import 'package:sayphi/mainApp/helpers/snack.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/user/model/genderModel.dart';
import 'package:sayphi/user/repository/getBasicData.dart';
import 'package:sayphi/user/repository/userRepo.dart';
import './widgets/genderBox.dart';
import '09_interested_in_and_ethinicity_screen.dart';

class UserGenderSetScreen extends StatefulWidget {
  const UserGenderSetScreen({Key? key}) : super(key: key);

  @override
  _UserGenderSetScreenState createState() => _UserGenderSetScreenState();
}

class _UserGenderSetScreenState extends State<UserGenderSetScreen> {

  late TextEditingController _controller;

  GenderModel? selectedGender;

  List<GenderModel>? _extraGenders;

  bool showGenderOnProfile = true;
  bool extraGender = false;

  final _male = GenderModel(id: '608bce580f50fa08afa3bd24', gender: 'Male');
  final _female = GenderModel(id: '608bce580f50fa08afa3bd23', gender: 'Female');

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()..addListener(() {
      searchGenders(_controller.text);
    });
  }

  RxString _searchValue = ''.obs;
  void searchGenders(String value) => _searchValue.value = value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.SCAFFOLD_BG_PINK,
      appBar: AppBar(),
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
                        selectedGender = _male;
                        extraGender = false;
                      });
                    },
                    child: GenderBox(
                      isSelected: selectedGender == _male,
                      label: 'Male',
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender = _female;
                        extraGender = false;
                      });
                    },
                    child: GenderBox(
                      isSelected: selectedGender == _female,
                      label: 'Female',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),

            /// Other genders bottom sheet
            Center(
              child: extraGender ?
                  /// when gender selected from bottom sheet showing special button
              Padding(
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
                          selectedGender!.gender.capitalize!,
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
              )
                  :
                  /// button to see other gender options
              TextButton(
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
              crossFadeState: selectedGender == null ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: Duration(milliseconds: 400)
            ),

            SizedBox(height: 20),
            MainButton(onPress: (){

              if(selectedGender != null){

                UserRepo.updateProfile(
                  genderId: selectedGender!.id,
                  showGender: showGenderOnProfile
                );

                Get.to(()=>InterestedInAndEthnicityChooseScreen());
              }else{
                Snack.top(
                  message: 'Please choose a gender to continue'
                );
              }

            }, label: 'Continue')
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
      child: Center(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: FutureBuilder<List<GenderModel>>(
            future: BasicDataRepo.getAllGenders(),
            initialData: _extraGenders,
            builder: (_, AsyncSnapshot<List<GenderModel>> snapshot){
              if(snapshot.hasData && snapshot.data != null){

                _extraGenders = snapshot.data;

                return Column(

                  children: [
                    AppBar(
                      centerTitle: true,
                      title: Text(
                        'Select a Gender',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: CFontFamily.REGULAR,
                          color: AppColor.TEXT_COLOR
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CTextField(
                        controller: _controller,
                        hintText: 'Search',
                      ),
                    ),

                    SizedBox(
                      height: Get.height * .65,
                      child: Obx((){

                        final data = snapshot.data!;

                        List<GenderModel> temp = [];

                        if(_searchValue.value != ''){
                          temp = data.where((element) => element.gender.toLowerCase().contains(_searchValue.value.toLowerCase())).toList();
                        }else{
                          temp = data;
                        }


                        return ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 12),
                          itemCount: temp.length,
                          itemBuilder: (_, index) {
                            GenderModel _gender = temp[index];
                            return InkWell(
                              onTap: (){
                                setState(() {
                                  selectedGender = _gender;
                                  extraGender = true;
                                });
                                Get.back();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  _gender.gender.capitalize!,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: CFontFamily.REGULAR
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }),
                    )


                  ],
                );
              }else{
                return Loader();
              }
            }
          ),
        ),
      ),
    ),isScrollControlled: true);
  }
}