import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/appConst.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';

class ProfileQuestionsScreen extends StatefulWidget {
  const ProfileQuestionsScreen({Key? key}) : super(key: key);

  @override
  _ProfileQuestionsScreenState createState() => _ProfileQuestionsScreenState();
}

class _ProfileQuestionsScreenState extends State<ProfileQuestionsScreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  bool showDoneBtn = false;
  double progress = .25;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  final _pages = [
    HeightAndActivity(),
    HobbyAndSmoking(),
    LookingForAndReligion(),
    HighestDegree(),
  ];

  @override
  Widget build(BuildContext context) {

    _buildDoneBtn () => SizedBox(
      height: 30,
      child: FloatingActionButton.extended(
        onPressed: (){},
        backgroundColor: AppColor.PRIMARY,
        elevation: 3,
        label: Text(
          'Done',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );

    _buildNextBtn () => InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: (){
        final nextPageIndex = _tabController.index + 1;
        setState(() {
          progress += .25;
        });
        if(nextPageIndex == 3){
          setState(() {
            showDoneBtn = true;
          });
        }
        _tabController.animateTo(nextPageIndex, duration: AppConst.DURATION);
      },
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            color: AppColor.PRIMARY,
            shape: BoxShape.circle
        ),
        child: Center(
          child: Icon(
            Icons.keyboard_arrow_right_rounded,
            color: Colors.white,
            size: 26,
          ),
        ),
      ),
    );

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
      body: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: _pages,
          ),

          Positioned(
            bottom: 28,
            left: Get.width * .4,
            right: Get.width * .4,
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Color(0xffD4D4D4),
              valueColor: AlwaysStoppedAnimation<Color>(AppColor.PRIMARY),
              minHeight: 4,
            ),
          )
        ],
      ),
      floatingActionButton: showDoneBtn ? _buildDoneBtn() : _buildNextBtn()
    );
  }
}

class HeightAndActivity extends StatefulWidget {
  const HeightAndActivity({Key? key}) : super(key: key);

  @override
  _HeightAndActivityState createState() => _HeightAndActivityState();
}

class _HeightAndActivityState extends State<HeightAndActivity> {
  int _heightFeet = 4;

  int _heightInch = 4;

  int _selectedActivity = 10000;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(width: double.infinity),

        Text(
          'How tall are you?',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              fontFamily: CFontFamily.MEDIUM
          ),
        ),

        SizedBox(height: 20),

        /// height picker
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Column(
              children: [
                Text(
                    'Feet'
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 100,
                  child: NumberPicker(
                    zeroPad: true,
                    infiniteLoop: true,
                    value: _heightFeet,
                    minValue: 2,
                    maxValue: 10,
                    onChanged: (value) => setState(() => _heightFeet = value),
                    selectedTextStyle: TextStyle(
                      color: AppColor.PRIMARY,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),

                  ),
                ),
              ],
            ),

            Column(
              children: [
                Text(
                    'Inch'
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 100,
                  child: NumberPicker(
                    zeroPad: true,
                    infiniteLoop: true,
                    value: _heightInch,
                    minValue: 0,
                    maxValue: 12,
                    onChanged: (value) => setState(() => _heightInch = value),
                    selectedTextStyle: TextStyle(
                      color: AppColor.PRIMARY,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            )

          ],
        ),

        Divider(
          height: 100,
          color: AppColor.BORDER_COLOR,
        ),

        ///activity chooser

        Text(
          'How active are you?',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              fontFamily: CFontFamily.MEDIUM
          ),
        ),

        SizedBox(height: 20),

        SizedBox(
          height: Get.height * .2,
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: 10,
            itemBuilder: (_, index) => InkWell(
              onTap: (){
                setState(() {
                  _selectedActivity = index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if(_selectedActivity == index) Icon(
                      Icons.check_circle,
                      color: AppColor.PRIMARY,
                      size: 20,
                    ),
                    if(_selectedActivity == index) SizedBox(width: 4),
                    Text(
                      'Option $index',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: _selectedActivity == index ? CFontFamily.MEDIUM : CFontFamily.REGULAR,
                          color: _selectedActivity == index ? AppColor.PRIMARY : null
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class HobbyAndSmoking extends StatefulWidget {
  const HobbyAndSmoking({Key? key}) : super(key: key);

  @override
  _HobbyAndSmokingState createState() => _HobbyAndSmokingState();
}

class _HobbyAndSmokingState extends State<HobbyAndSmoking> {

  int _selectedHobby = 10000;
  int _selectedOpinion = 10000;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(width: double.infinity),

        Text(
          'What is your hobby?',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              fontFamily: CFontFamily.MEDIUM
          ),
        ),

        SizedBox(height: 20),

        /// hobby picker
        SizedBox(
          height: Get.height * .2,
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: 10,
            itemBuilder: (_, index) => InkWell(
              onTap: (){
                setState(() {
                  _selectedHobby = index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if(_selectedHobby == index) Icon(
                      Icons.check_circle,
                      color: AppColor.PRIMARY,
                      size: 20,
                    ),
                    if(_selectedHobby == index) SizedBox(width: 4),
                    Text(
                      'Hobby $index',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: _selectedHobby == index ? CFontFamily.MEDIUM : CFontFamily.REGULAR,
                          color: _selectedHobby == index ? AppColor.PRIMARY : null
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),

        Divider(
          height: 100,
          color: AppColor.BORDER_COLOR,
        ),

        ///activity chooser

        Text(
          'What is your opinion on smoking?',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              fontFamily: CFontFamily.MEDIUM
          ),
        ),

        SizedBox(height: 20),

        SizedBox(
          height: Get.height * .2,
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: 10,
            itemBuilder: (_, index) => InkWell(
              onTap: (){
                setState(() {
                  _selectedOpinion = index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if(_selectedOpinion == index) Icon(
                      Icons.check_circle,
                      color: AppColor.PRIMARY,
                      size: 20,
                    ),
                    if(_selectedOpinion == index) SizedBox(width: 4),
                    Text(
                      'Opinion $index',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: _selectedOpinion == index ? CFontFamily.MEDIUM : CFontFamily.REGULAR,
                          color: _selectedOpinion == index ? AppColor.PRIMARY : null
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LookingForAndReligion extends StatefulWidget {
  const LookingForAndReligion({Key? key}) : super(key: key);

  @override
  _LookingForAndReligionState createState() => _LookingForAndReligionState();
}

class _LookingForAndReligionState extends State<LookingForAndReligion> {
  int _selectedLookingFor = 10000;
  int _selectedReligionLevel = 10000;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(width: double.infinity),

        Text(
          'What are you looking for?',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              fontFamily: CFontFamily.MEDIUM
          ),
        ),

        SizedBox(height: 20),

        /// hobby picker
        SizedBox(
          height: Get.height * .2,
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: 10,
            itemBuilder: (_, index) => InkWell(
              onTap: (){
                setState(() {
                  _selectedLookingFor = index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if(_selectedLookingFor == index) Icon(
                      Icons.check_circle,
                      color: AppColor.PRIMARY,
                      size: 20,
                    ),
                    if(_selectedLookingFor == index) SizedBox(width: 4),
                    Text(
                      'Looking $index',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: _selectedLookingFor == index ? CFontFamily.MEDIUM : CFontFamily.REGULAR,
                          color: _selectedLookingFor == index ? AppColor.PRIMARY : null
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),

        Divider(
          height: 100,
          color: AppColor.BORDER_COLOR,
        ),

        ///activity chooser

        Text(
          'Are you religious?',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              fontFamily: CFontFamily.MEDIUM
          ),
        ),

        SizedBox(height: 20),

        SizedBox(
          height: Get.height * .2,
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: 10,
            itemBuilder: (_, index) => InkWell(
              onTap: (){
                setState(() {
                  _selectedReligionLevel = index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if(_selectedReligionLevel == index) Icon(
                      Icons.check_circle,
                      color: AppColor.PRIMARY,
                      size: 20,
                    ),
                    if(_selectedReligionLevel == index) SizedBox(width: 4),
                    Text(
                      'Level $index',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: _selectedReligionLevel == index ? CFontFamily.MEDIUM : CFontFamily.REGULAR,
                          color: _selectedReligionLevel == index ? AppColor.PRIMARY : null
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HighestDegree extends StatefulWidget {
  const HighestDegree({Key? key}) : super(key: key);

  @override
  _HighestDegreeState createState() => _HighestDegreeState();
}

class _HighestDegreeState extends State<HighestDegree> {
  int _selectedDegree = 10000;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(width: double.infinity),

        Text(
          'What is your hobby?',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              fontFamily: CFontFamily.MEDIUM
          ),
        ),

        SizedBox(height: 20),

        /// hobby picker
        SizedBox(
          height: Get.height * .5,
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: 10,
            itemBuilder: (_, index) => InkWell(
              onTap: (){
                setState(() {
                  _selectedDegree = index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if(_selectedDegree == index) Icon(
                      Icons.check_circle,
                      color: AppColor.PRIMARY,
                      size: 20,
                    ),
                    if(_selectedDegree == index) SizedBox(width: 4),
                    Text(
                      'Degree $index',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: _selectedDegree == index ? CFontFamily.MEDIUM : CFontFamily.REGULAR,
                          color: _selectedDegree == index ? AppColor.PRIMARY : null
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


