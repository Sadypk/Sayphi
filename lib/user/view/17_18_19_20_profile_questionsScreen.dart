import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:sayphi/mainApp/model/questionAnswerModel.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/appConst.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/mainApp/view/home.dart';
import 'package:sayphi/mainApp/view_model/appViewModel.dart';
import 'package:sayphi/user/repository/userRepo.dart';

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
    QuestionAnswerPage1(),
    QuestionAnswerPage2(),
    QuestionAnswerPage3(),
    QuestionAnswerPage4(),
  ];

  void navigateNext(){

    final _tabIndex = _tabController.index;
    final nextPageIndex = _tabIndex + 1;

    if(_tabIndex == 0){

      double userHeight = (QuestionAnswerPage1.heightFeet * 30.48) + (QuestionAnswerPage1.heightInch * 2.54);

      UserRepo.updateProfile(
        userHeight: userHeight.toInt(),
        questionID: QuestionAnswerPage1.selectedAnswer == '' ? null : AppViewModel.appQuestionAnswers[0].id,
        questionAnswer: QuestionAnswerPage1.selectedAnswer == '' ? null : QuestionAnswerPage1.selectedAnswer,
      );
    } else if(_tabIndex == 1){

      if( QuestionAnswerPage2.answer1 != ''){

        UserRepo.updateProfile(
          questionID: QuestionAnswerPage2.answer1 == '' ? null : AppViewModel.appQuestionAnswers[1].id,
          questionAnswer: QuestionAnswerPage2.answer1 == '' ? null : QuestionAnswerPage2.answer1,
        );
      }

      if( QuestionAnswerPage2.answer2 != ''){
        UserRepo.updateProfile(
          questionID: QuestionAnswerPage2.answer2 == '' ? null : AppViewModel.appQuestionAnswers[2].id,
          questionAnswer: QuestionAnswerPage2.answer2 == '' ? null : QuestionAnswerPage2.answer2,
        );
      }

    } else if(_tabIndex == 2){

      if( QuestionAnswerPage3.answer1 != ''){
        UserRepo.updateProfile(
          questionID: QuestionAnswerPage3.answer1 == '' ? null : AppViewModel.appQuestionAnswers[3].id,
          questionAnswer: QuestionAnswerPage3.answer1 == '' ? null : QuestionAnswerPage3.answer1,
        );
      }

      if( QuestionAnswerPage3.answer2 != ''){
        UserRepo.updateProfile(
          questionID: QuestionAnswerPage3.answer2 == '' ? null : AppViewModel.appQuestionAnswers[4].id,
          questionAnswer: QuestionAnswerPage3.answer2 == '' ? null : QuestionAnswerPage3.answer2,
        );
      }

    } else if(_tabIndex == 3){
      if( QuestionAnswerPage4.answer1 != ''){
        UserRepo.updateProfile(
          questionID: QuestionAnswerPage4.answer1 == '' ? null : AppViewModel.appQuestionAnswers[5].id,
          questionAnswer: QuestionAnswerPage4.answer1 == '' ? null : QuestionAnswerPage4.answer1,
        );
      }
    }

    setState(() {
      progress += .25;
    });
    if(nextPageIndex == 3){
      setState(() {
        showDoneBtn = true;
      });
    }
    _tabController.animateTo(nextPageIndex, duration: AppConst.DURATION);
  }

  @override
  Widget build(BuildContext context) {

    _buildDoneBtn () => SizedBox(
      height: 30,
      child: FloatingActionButton.extended(
        onPressed: (){
          Get.offAll(()=>Home());
        },
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
      onTap: navigateNext,
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
            if(!showDoneBtn)TextButton(
                onPressed: navigateNext,
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


class QuestionAnswerPage1 extends StatefulWidget {

  static int heightFeet = 4;

  static int heightInch = 4;

  static String selectedAnswer = '';


  const QuestionAnswerPage1({Key? key}) : super(key: key);

  @override
  _QuestionAnswerPage1State createState() => _QuestionAnswerPage1State();
}

class _QuestionAnswerPage1State extends State<QuestionAnswerPage1> {

  late QuestionAnswerModel _questionAnswer;


  @override
  void initState() {
    super.initState();
    _questionAnswer = AppViewModel.appQuestionAnswers[0];
  }

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
                    value: QuestionAnswerPage1.heightFeet,
                    minValue: 2,
                    maxValue: 10,
                    onChanged: (value) => setState(() => QuestionAnswerPage1.heightFeet = value),
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
                    value: QuestionAnswerPage1.heightInch,
                    minValue: 0,
                    maxValue: 12,
                    onChanged: (value) => setState(() => QuestionAnswerPage1.heightInch = value),
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
          _questionAnswer.question,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              fontFamily: CFontFamily.MEDIUM
          ),
        ),

        SizedBox(height: 20),

        SizedBox(
          height: Get.height * .35,
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: _questionAnswer.options.length,
            itemBuilder: (_, index) {

              final option = _questionAnswer.options[index];

              final isSelected = QuestionAnswerPage1.selectedAnswer == option;


              return InkWell(
                onTap: (){
                  setState(() {
                    QuestionAnswerPage1.selectedAnswer = option;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if(isSelected) Icon(
                        Icons.check_circle,
                        color: AppColor.PRIMARY,
                        size: 20,
                      ),
                      if(isSelected) SizedBox(width: 4),
                      Text(
                        option,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: isSelected ? CFontFamily.MEDIUM : CFontFamily.REGULAR,
                            color: isSelected ? AppColor.PRIMARY : null
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class QuestionAnswerPage2 extends StatefulWidget {

  static String answer1 = '';
  static String answer2 = '';

  const QuestionAnswerPage2({Key? key}) : super(key: key);

  @override
  _QuestionAnswerPage2State createState() => _QuestionAnswerPage2State();
}

class _QuestionAnswerPage2State extends State<QuestionAnswerPage2> {


  late QuestionAnswerModel _questionAnswer1;
  late QuestionAnswerModel _questionAnswer2;


  @override
  void initState() {
    super.initState();
    _questionAnswer1 = AppViewModel.appQuestionAnswers[1];
    _questionAnswer2 = AppViewModel.appQuestionAnswers[2];
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(width: double.infinity),

        Text(
        _questionAnswer1.question,
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
            itemCount: _questionAnswer1.options.length,
            itemBuilder: (_, index) {

              final option = _questionAnswer1.options[index];
              final isSelected = QuestionAnswerPage2.answer1 == option;

              return InkWell(
                onTap: (){
                  setState(() {
                    QuestionAnswerPage2.answer1 = option;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if(isSelected) Icon(
                        Icons.check_circle,
                        color: AppColor.PRIMARY,
                        size: 20,
                      ),
                      if(isSelected) SizedBox(width: 4),
                      Text(
                        option,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: isSelected ? CFontFamily.MEDIUM : CFontFamily.REGULAR,
                            color: isSelected ? AppColor.PRIMARY : null
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        Divider(
          height: 100,
          color: AppColor.BORDER_COLOR,
        ),

        ///activity chooser

        Text(
          _questionAnswer2.question,
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
            itemCount: _questionAnswer2.options.length,
            itemBuilder: (_, index) {

              final option = _questionAnswer2.options[index];
              final isSelected = QuestionAnswerPage2.answer2 == option;

              return InkWell(
                onTap: (){
                  setState(() {
                    QuestionAnswerPage2.answer2 = option;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if(isSelected) Icon(
                        Icons.check_circle,
                        color: AppColor.PRIMARY,
                        size: 20,
                      ),
                      if(isSelected) SizedBox(width: 4),
                      Text(
                        option,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: isSelected ? CFontFamily.MEDIUM : CFontFamily.REGULAR,
                            color: isSelected ? AppColor.PRIMARY : null
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class QuestionAnswerPage3 extends StatefulWidget {

  static String answer1 = '';
  static String answer2 = '';

  const QuestionAnswerPage3({Key? key}) : super(key: key);

  @override
  _QuestionAnswerPage3State createState() => _QuestionAnswerPage3State();
}

class _QuestionAnswerPage3State extends State<QuestionAnswerPage3> {


  late QuestionAnswerModel _questionAnswer1;
  late QuestionAnswerModel _questionAnswer2;


  @override
  void initState() {
    super.initState();
    _questionAnswer1 = AppViewModel.appQuestionAnswers[3];
    _questionAnswer2 = AppViewModel.appQuestionAnswers[4];
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(width: double.infinity),

        Text(
          _questionAnswer1.question,
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
            itemCount: _questionAnswer1.options.length,
            itemBuilder: (_, index) {

              final option = _questionAnswer1.options[index];
              final isSelected = QuestionAnswerPage3.answer1 == option;

              return InkWell(
                onTap: (){
                  setState(() {
                    QuestionAnswerPage3.answer1 = option;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if(isSelected) Icon(
                        Icons.check_circle,
                        color: AppColor.PRIMARY,
                        size: 20,
                      ),
                      if(isSelected) SizedBox(width: 4),
                      Text(
                        option,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: isSelected ? CFontFamily.MEDIUM : CFontFamily.REGULAR,
                            color: isSelected ? AppColor.PRIMARY : null
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        Divider(
          height: 100,
          color: AppColor.BORDER_COLOR,
        ),

        ///activity chooser

        Text(
          _questionAnswer2.question,
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
            itemCount: _questionAnswer2.options.length,
            itemBuilder: (_, index) {

              final option = _questionAnswer2.options[index];
              final isSelected = QuestionAnswerPage3.answer2 == option;

              return InkWell(
                onTap: (){
                  setState(() {
                    QuestionAnswerPage3.answer2 = option;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if(isSelected) Icon(
                        Icons.check_circle,
                        color: AppColor.PRIMARY,
                        size: 20,
                      ),
                      if(isSelected) SizedBox(width: 4),
                      Text(
                        option,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: isSelected ? CFontFamily.MEDIUM : CFontFamily.REGULAR,
                            color: isSelected ? AppColor.PRIMARY : null
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class QuestionAnswerPage4 extends StatefulWidget {

  static String answer1 = '';

  const QuestionAnswerPage4({Key? key}) : super(key: key);

  @override
  _QuestionAnswerPage4State createState() => _QuestionAnswerPage4State();
}

class _QuestionAnswerPage4State extends State<QuestionAnswerPage4> {


  late QuestionAnswerModel _questionAnswer1;


  @override
  void initState() {
    super.initState();
    _questionAnswer1 = AppViewModel.appQuestionAnswers[5];
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(width: double.infinity),

        Text(
          _questionAnswer1.question,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              fontFamily: CFontFamily.MEDIUM
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          height: Get.height * .4,
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: _questionAnswer1.options.length,
            itemBuilder: (_, index) {

              final option = _questionAnswer1.options[index];
              final isSelected = QuestionAnswerPage4.answer1 == option;

              return InkWell(
                onTap: (){
                  setState(() {
                    QuestionAnswerPage4.answer1 = option;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if(isSelected) Icon(
                        Icons.check_circle,
                        color: AppColor.PRIMARY,
                        size: 20,
                      ),
                      if(isSelected) SizedBox(width: 4),
                      Text(
                        option,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: isSelected ? CFontFamily.MEDIUM : CFontFamily.REGULAR,
                            color: isSelected ? AppColor.PRIMARY : null
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}