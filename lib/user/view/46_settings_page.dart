import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:get/get.dart';
import 'package:language_picker/language_picker_dialog.dart';
import 'package:language_picker/languages.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:sayphi/mainApp/components/loader.dart';
import 'package:sayphi/mainApp/components/mainButton.dart';
import 'package:sayphi/mainApp/config/rest/apiConfig.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/appConst.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/mainApp/util/env.dart';
import 'package:sayphi/user/model/religionModel.dart';
import 'package:sayphi/user/repository/getBasicData.dart';
import 'package:sayphi/user/repository/userRepo.dart';
import 'package:sayphi/user/view_model/userViewModel.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  //Variables
  late RangeValues ageRange;

  @override
  void initState() {
    super.initState();
    ageRange = RangeValues(UserViewModel.user.value.filters.ageRange!.start.toDouble(), UserViewModel.user.value.filters.ageRange!.end.toDouble());
  }

  void updateAgeRange(RangeValues newRange) async{


/*    try{
      final start = int.parse(newRange.start.toString());
      final end = int.parse(newRange.end.toString());
      UserRepo.updateProfile(ageRangeStart: start, ageRangeEnd: end);
    }catch(e){

    }*/


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.SCAFFOLD_BG_PINK,
      appBar: AppBar(
        title: Text('Profile settings', style: TextStyle(color: AppColor.TEXT_COLOR, fontSize: 16, fontFamily: CFontFamily.REGULAR),),
        centerTitle: true,
      ),
      body: Obx((){

        final _user = UserViewModel.user.value;

        final _locationController = TextEditingController(text: _user.filters.location!.name ?? 'Search Nearby');

        return ListView(
          children: [
            //Boost and subscription
            SizedBox(height: 10,),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              elevation: 3,
              child: Container(
                height: 80,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Boost and subscription', style: TextStyle(color: AppColor.PRIMARY, fontSize: 16),),
                    SizedBox(height: 5,),
                    Text('Boost and buy subscriptions for your id to get a first class dating experience', style: TextStyle(fontSize: 12, color: AppColor.TEXT_LIGHT), textAlign: TextAlign.center,),
                  ],
                ),
              ),
            ),


            SizedBox(height: 20,),

            //User rank / Received credit
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              elevation: 3,
              child: Container(
                height: 80,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('User rank / Received credit', style: TextStyle(color: AppColor.PRIMARY, fontSize: 16),),
                    SizedBox(height: 5,),
                    Text('To update your user rank and get more credits purchase your suitable pack', style: TextStyle(fontSize: 12, color: AppColor.TEXT_LIGHT), textAlign: TextAlign.center,),
                  ],
                ),
              ),
            ),


            SizedBox(height: 20,),


            //Filter option
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Filter option', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(height: 25,),


                  //Location
                  Text('Location', style: TextStyle(fontSize: 16),),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: () async{
                      final place = await PlacesAutocomplete.show(
                        context: context,
                        apiKey: Env.googleKey,
                        mode: Mode.overlay, // or Mode.fullscreen
                        language: 'en',
                        types: [],
                        components: [],
                        strictbounds: false,
                        logo: SizedBox(),
                        // components: [Component(Component.country, "fr")],
                      );
                      if(place != null){
                        final _latlng = await RestApi.getLatLngFromPlaceID(place.placeId!);
                        UserRepo.updateProfile(userLocationName: place.description, latitude: _latlng.latitude, longitude: _latlng.longitude);
                      }
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        enabled: false,
                        controller: _locationController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          suffixIcon: Transform.rotate(
                              angle: 45,
                              child: Icon(Icons.navigation, color: AppColor.DARK_GREY,)),
                          hintStyle: TextStyle(fontSize: 12, color: AppColor.TEXT_LIGHT),
                        ),
                      ),
                    ),
                  ),


                  SizedBox(height: 20,),


                  //I'm interested in
                  Text('I\'m interested in', style: TextStyle(fontSize: 16),),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () => UserRepo.updateProfile(interestedIn: 'Men'),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: _user.filters.interestedIn=='Men'?AppColor.PRIMARY:Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: _user.filters.interestedIn=='Men'?Colors.transparent:AppColor.BORDER_COLOR.withOpacity(0.3), width: 1)
                            ),
                            child: Center(
                              child: Text('Men', style: TextStyle(fontSize: 12, color: _user.filters.interestedIn=='Men'?Colors.white:AppColor.TEXT_LIGHT),),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Flexible(
                        child: InkWell(
                          onTap: () => UserRepo.updateProfile(interestedIn: 'Women'),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: _user.filters.interestedIn=='Women'?AppColor.PRIMARY:Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: _user.filters.interestedIn=='Women'?Colors.transparent:AppColor.BORDER_COLOR.withOpacity(0.3), width: 1)
                            ),
                            child: Center(
                              child: Text('Women', style: TextStyle(fontSize: 12, color: _user.filters.interestedIn=='Women'?Colors.white:AppColor.TEXT_LIGHT),),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Flexible(
                        child: InkWell(
                          onTap: () => UserRepo.updateProfile(interestedIn: 'Both'),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: _user.filters.interestedIn=='Both'?AppColor.PRIMARY:Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: _user.filters.interestedIn=='Both'?Colors.transparent:AppColor.BORDER_COLOR.withOpacity(0.3), width: 1)
                            ),
                            child: Center(
                              child: Text('Both', style: TextStyle(fontSize: 12, color: _user.filters.interestedIn=='Both'?Colors.white:AppColor.TEXT_LIGHT),),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),



                  SizedBox(height: 20,),



                  //Filter by
                  Text('Filter by', style: TextStyle(fontSize: 16),),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () => UserRepo.updateProfile(filterBy: 'All'),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: _user.filters.filterBy=='All'?AppColor.PRIMARY:Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: _user.filters.filterBy=='All'?Colors.transparent:AppColor.BORDER_COLOR.withOpacity(0.3), width: 1)
                            ),
                            child: Center(
                              child: Text('All', style: TextStyle(fontSize: 12, color: _user.filters.filterBy=='All'?Colors.white:AppColor.TEXT_LIGHT),),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Flexible(
                        child: InkWell(
                          onTap: () => UserRepo.updateProfile(filterBy: 'Online'),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: _user.filters.filterBy=='Online'?AppColor.PRIMARY:Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: _user.filters.filterBy=='Online'?Colors.transparent:AppColor.BORDER_COLOR.withOpacity(0.3), width: 1)
                            ),
                            child: Center(
                              child: Text('Online', style: TextStyle(fontSize: 12, color: _user.filters.filterBy=='Online'?Colors.white:AppColor.TEXT_LIGHT),),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Flexible(
                        child: InkWell(
                          onTap: () => UserRepo.updateProfile(filterBy: 'New'),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: _user.filters.filterBy=='New'?AppColor.PRIMARY:Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: _user.filters.filterBy=='New'?Colors.transparent:AppColor.BORDER_COLOR.withOpacity(0.3), width: 1)
                            ),
                            child: Center(
                              child: Text('New', style: TextStyle(fontSize: 12, color: _user.filters.filterBy=='New'?Colors.white:AppColor.TEXT_LIGHT),),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),



                  SizedBox(height: 20,),

                  //Age range
                  StatefulBuilder(builder: (BuildContext context, void Function(void Function()) __setState)  => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Age range', style: TextStyle(fontSize: 16),),
                          Text('${ageRange.start.toInt()}-${ageRange.end.toInt()}', style: TextStyle(color: AppColor.PRIMARY, fontSize: 14),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      RangeSlider(
                        values: ageRange,
                        onChangeEnd: (changedRange){
                          try{
                            final start = changedRange.start.toInt();
                            final end = changedRange.end.toInt();
                            UserRepo.updateProfile(ageRangeStart: start, ageRangeEnd: end);
                          }catch(e){
                            print(e.toString());
                          }
                        },
                        onChanged: (newRange){
                          __setState(() {
                            ageRange = newRange;
                          });

                          print(newRange.start);


                        },
                        min: 0,
                        max: 100,
                        divisions: 100,
                        activeColor: AppColor.PRIMARY,
                      ),
                    ],
                  )),



                  SizedBox(height: 20,),



                  //Advanced filter
                  Text('Advanced filter', style: TextStyle(fontSize: 16),),
                  SizedBox(height: 15,),
                  advancedFilterListTile('Icon metro-language.png', 'Language', (){
                    showDialog(
                      context: context,
                      builder: (context) => Theme(
                          data: Theme.of(context).copyWith(primaryColor: Colors.pink),
                          child: LanguagePickerDialog(
                              titlePadding: EdgeInsets.all(8.0),
                              searchCursorColor: Colors.pinkAccent,
                              searchInputDecoration: InputDecoration(hintText: 'Search...'),
                              isSearchable: true,
                              title: Text('Select your language'),
                              onValuePicked: (Language language) => UserRepo.updateProfile(language: language.name),
                              itemBuilder: (Language language)=>Row(
                                children: <Widget>[
                                  Text(language.name),
                                  SizedBox(width: 8.0),
                                  Flexible(child: Text("(${language.isoCode})"))
                                ],
                              ))),
                    );
                  }, UserViewModel.user.value.filters.language ?? 'Answer'),

                  advancedFilterListTile('Icon awesome-check-circle.png', 'Photo verified', (){}, _user.filters.photoVerified ? 'Verified' : 'Unverified'),



                  SizedBox(height: 20,),



                  //More option
                  Text('More option', style: TextStyle(fontSize: 16),),
                  SizedBox(height: 10,),
                  Text('Answer these questions on your own profile to use these filters', style: TextStyle(fontSize: 12, color: AppColor.TEXT_LIGHT),),
                  SizedBox(height: 15,),
                  advancedFilterListTile('Icon awesome-ruler.png', 'Height', () async{

                    int? selectedValue = _user.height ?? 140;

                    await Get.dialog(Dialog(
                      child: StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setStateHeight) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          NumberPicker(
                            zeroPad: true,
                            infiniteLoop: true,
                            value: selectedValue!,
                            minValue: 100,
                            maxValue: 200,
                            onChanged: (value) {
                              setStateHeight((){
                                selectedValue = value;
                              });
                            },
                            selectedTextStyle: TextStyle(
                                color: AppColor.PRIMARY,
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: MainButton(onPress: Get.back, label: 'Choose'),
                          )
                        ],
                      )),
                    ));

                    UserRepo.updateProfile(userHeight: selectedValue);

                  }, '${_user.height == null ? 'Answer' : '${_user.height} cm'}'),
                  advancedFilterListTile('Icon material-child-care.png', 'Children', () async{

                    int? selectedValue = _user.filters.children!.start;

                    await Get.dialog(Dialog(
                      child: StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setStateHeight) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          NumberPicker(
                            zeroPad: true,
                            infiniteLoop: true,
                            value: selectedValue!,
                            minValue: 0,
                            maxValue: 10,
                            onChanged: (value) {
                              setStateHeight((){
                                selectedValue = value;
                              });
                            },
                            selectedTextStyle: TextStyle(
                                color: AppColor.PRIMARY,
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: MainButton(onPress: Get.back, label: 'Choose'),
                          )
                        ],
                      )),
                    ));

                    UserRepo.updateProfile(childrenRangeStart: selectedValue);

                  }, _user.filters.children!.start > 0 ? _user.filters.children!.start.toString() : 'Answer'),
                  advancedFilterListTile('Icon awesome-smoking.png', 'Smoking', () async{

                    bool selectedValue = _user.filters.smoking;

                    await Get.dialog(Dialog(
                      child: StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setStateHeight) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Do you Smoke?',
                              style: TextStyle(
                                fontSize: 18
                              ),
                            ),
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: RadioListTile(
                                  value: true,
                                  groupValue: selectedValue,
                                  onChanged: (bool? value){
                                    setStateHeight((){
                                      selectedValue = value!;
                                    });
                                  },
                                  title: Text(
                                    'Yes'
                                  ),
                                ),
                              ),
                              Expanded(
                                child: RadioListTile(
                                  value: false,
                                  groupValue: selectedValue,
                                  onChanged: (bool? value){
                                    setStateHeight((){
                                      selectedValue = value!;
                                    });
                                  },
                                  title: Text(
                                    'No'
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: MainButton(onPress: Get.back, label: 'Confirm'),
                          )
                        ],
                      )),
                    ));

                    UserRepo.updateProfile(smoking: selectedValue);

                  }, _user.filters.smoking ? 'Yes' : 'No'),
                  advancedFilterListTile('Icon material-pets.png', 'Pets', () async{

                    bool selectedValue = _user.filters.pets;

                    await Get.dialog(Dialog(
                      child: StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setStateHeight) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Do you like pets?',
                              style: TextStyle(
                                  fontSize: 18
                              ),
                            ),
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: RadioListTile(
                                  value: true,
                                  groupValue: selectedValue,
                                  onChanged: (bool? value){
                                    setStateHeight((){
                                      selectedValue = value!;
                                    });
                                  },
                                  title: Text(
                                      'Yes'
                                  ),
                                ),
                              ),
                              Expanded(
                                child: RadioListTile(
                                  value: false,
                                  groupValue: selectedValue,
                                  onChanged: (bool? value){
                                    setStateHeight((){
                                      selectedValue = value!;
                                    });
                                  },
                                  title: Text(
                                      'No'
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: MainButton(onPress: Get.back, label: 'Confirm'),
                          )
                        ],
                      )),
                    ));

                    UserRepo.updateProfile(pets: selectedValue);

                  }, _user.filters.pets ? 'Yes' : 'No'),
                  advancedFilterListTile('Icon awesome-praying-hands.png', 'Religion', () async{


                    ReligionModel? selectedValue = _user.religion;

                    await Get.dialog(Dialog(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Please Choose a religion?',
                              style: TextStyle(
                                  fontSize: 18
                              ),
                            ),
                          ),

                          SizedBox(
                            height: Get.height * .4,
                            child: FutureBuilder(
                              future: BasicDataRepo.getAllReligion(),
                              builder: (_, AsyncSnapshot<List<ReligionModel>> snapshot){

                                if(snapshot.hasData && snapshot.data !=null){
                                  return StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setStateHeight) => GridView.builder(
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 12,
                                        mainAxisSpacing: 12,
                                        childAspectRatio: 16/5
                                    ),
                                    itemCount: snapshot.data!.length,
                                    padding: EdgeInsets.all(12),
                                    itemBuilder: (_, index) {

                                      final _religion = snapshot.data![index];

                                      final _isSelected = selectedValue!.id == _religion.id;

                                      return GestureDetector(
                                        onTap: (){
                                          setStateHeight((){
                                            selectedValue = _religion;
                                          });
                                        },
                                        child: Card(
                                            color: _isSelected ? AppColor.PRIMARY : Colors.white,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                                              child: Center(
                                                child: Text(
                                                  _religion.religion,
                                                  style: TextStyle(
                                                      color: _isSelected ? Colors.white : AppColor.TEXT_COLOR
                                                  ),
                                                ),
                                              ),
                                            )
                                        ),
                                      );

                                    },
                                  ));
                                }else{
                                  return Loader();
                                }

                              },
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: MainButton(onPress: (){
                              Get.back();
                              if(selectedValue != null){
                                UserRepo.updateProfile(filterReligion: selectedValue!.id);
                              }
                            }, label: 'Confirm'),
                          )
                        ],
                      )
                    ));



                  }, _user.religion == null ? 'Asnwer' : _user.religion!.religion),


                  SizedBox(height: 10,),


                  //Apply filter button
                  MainButton(
                    onPress: (){},
                    label: 'Apply filter',
                    textStyle: TextStyle(
                        fontSize: 18,
                        fontFamily: CFontFamily.REGULAR,
                        color: Colors.white
                    ),
                  ),
                  Divider(height: 50,),




                  //More option
                  Text('More option', style: TextStyle(fontSize: 16),),
                  SizedBox(height: 10,),
                  Text('Browse the apps in incognito mode (Paid only)', style: TextStyle(fontSize: 12, color: AppColor.TEXT_LIGHT),),
                  SizedBox(height: 10,),
                  MainButton(
                    onPress: (){},
                    label: 'Browse incognito',
                    assetLeadingIcon: 'assets/icons/incognito-6-902117.png',
                    textStyle: TextStyle(
                        fontSize: 18,
                        fontFamily: CFontFamily.REGULAR,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            )
          ],
        );
      }),
    );
  }

  advancedFilterListTile(String assetName, String label, VoidCallback onTap, String label2){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      height: 16,
                      width: 16,
                      child: Image.asset('assets/icons/$assetName', fit: BoxFit.cover,),
                    ),
                    SizedBox(width: 5,),
                    Text(label, style: TextStyle(fontSize: 16, color: AppColor.TEXT_LIGHT),)
                  ],
                ),
                Row(
                  children: [
                    Text(label2, style: TextStyle(fontSize: 14, color: AppColor.TEXT_LIGHT),),
                    SizedBox(width: 3,),
                    Icon(Icons.arrow_forward_ios, size: 14,)
                  ],
                )
              ],
            ),
            Divider(height: 30),
          ],
        ),
      ),
    );
  }
}
