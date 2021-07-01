import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';


class AnimationModel{
  AnimationController controller;
  Animation animation;

  AnimationModel({
    required this.controller,
    required this.animation
  });
}

class SmartPicksScreen extends StatefulWidget {
  @override
  _SmartPicksScreenState createState() => _SmartPicksScreenState();
}

class _SmartPicksScreenState extends State<SmartPicksScreen> with TickerProviderStateMixin{
  double initial = 0.8;
  double end = 1;

  //Controller
  late AnimationController controller1;
  late AnimationController controller2;
  late AnimationController controller3;
  late AnimationController controller4;

  //Animation
  late Animation<double> scaleAnimation1;
  late Animation<double> scaleAnimation2;
  late Animation<double> scaleAnimation3;
  late Animation<double> scaleAnimation4;


  @override
  void initState() {
    controller1 = AnimationController(vsync: this, duration: Duration(seconds: 2));
    controller2 = AnimationController(vsync: this, duration: Duration(seconds: 2));
    controller3 = AnimationController(vsync: this, duration: Duration(seconds: 2));
    controller4 = AnimationController(vsync: this, duration: Duration(seconds: 2));

    scaleAnimation1 = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: initial, end: end)
              .chain(CurveTween(curve: Curves.easeIn)),
          weight: 1,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: end, end: initial)
              .chain(CurveTween(curve: Curves.easeOut)),
          weight: 2,
        ),
      ],
    ).animate(controller1);
    scaleAnimation2 = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: initial, end: end)
              .chain(CurveTween(curve: Curves.easeIn)),
          weight: 1,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1, end: initial)
              .chain(CurveTween(curve: Curves.easeOut)),
          weight: 2,
        ),
      ],
    ).animate(controller2);
    scaleAnimation3 = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: initial, end: end)
              .chain(CurveTween(curve: Curves.easeIn)),
          weight: 1,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: end, end: initial)
              .chain(CurveTween(curve: Curves.easeOut)),
          weight: 2,
        ),
      ],
    ).animate(controller3);
    scaleAnimation4 = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: initial, end: end)
              .chain(CurveTween(curve: Curves.easeIn)),
          weight: 1,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: end, end: initial)
              .chain(CurveTween(curve: Curves.easeOut)),
          weight: 2,
        ),
      ],
    ).animate(controller4);


    controller1.repeat();
    Future.delayed(Duration(milliseconds: 500), (){controller2.repeat();});
    Future.delayed(Duration(milliseconds: 1000), (){controller3.repeat();});
    Future.delayed(Duration(microseconds: 1500), (){controller4.repeat();});
    super.initState();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;


    List<AnimationModel> list =  [
      AnimationModel(controller: controller1, animation: scaleAnimation1),
      AnimationModel(controller: controller2, animation: scaleAnimation2),
      AnimationModel(controller: controller3, animation: scaleAnimation3),
      AnimationModel(controller: controller4, animation: scaleAnimation4),
    ];


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: Get.back, icon: Icon(Icons.cancel, color: Colors.white,))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink, Colors.pinkAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index){
            int random = Random().nextInt(3);
            return Container(
              height: 100,
              width: w,
              child: Row(
                mainAxisAlignment: index%2==0?MainAxisAlignment.end:MainAxisAlignment.start,
                children: [
                  if(index%2!=0)SizedBox(width: Random().nextInt((w*0.4).toInt()).toDouble()+10),
                  AnimatedBuilder(
                    animation: list[random].controller,
                    builder: (BuildContext context, _){
                      return Stack(
                        children: [
                          Container(
                            height: list[random].animation.value*80,
                            width: list[random].animation.value*80,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 1),
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: list[random].animation.value+1,
                                      color: Colors.black26,
                                      blurRadius: list[random].animation.value+1,
                                      offset: Offset(1,1)
                                  )
                                ],
                                image: DecorationImage(
                                    image: NetworkImage('https://c.files.bbci.co.uk/41FB/production/_113919861_hi045965426.jpg'),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          Positioned(
                            top: list[random].animation.value*5,
                            right: list[random].animation.value*5,
                            child: Container(
                              height: list[random].animation.value*24,
                              width: list[random].animation.value*24,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(FontAwesomeIcons.solidHeart, color: Colors.white, size: list[random].animation.value*13,),
                              ),
                            )
                          )
                        ],
                      );
                    }),
                  if(index%2==0)SizedBox(width: Random().nextInt((w*0.4).toInt()).toDouble()+10),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
