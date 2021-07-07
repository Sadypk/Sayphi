import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';

class BoosSubscriptionScreen extends StatelessWidget {
  const BoosSubscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.PRIMARY
            ),
            child: Center(
              child: Icon(
                Icons.flash_on,
                color: Colors.amber,
                size: 30,
              ),
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Need more boost',
            style: TextStyle(
              fontSize: 20,
              fontFamily: CFontFamily.MEDIUM
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Become a top profile in your area by\nboosting your profile',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.PRIMARY
                ),
                child: Center(
                  child: Text(
                    'Boost',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white
                    ),
                  )
                ),
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.PRIMARY_DARK
                ),
                child: Center(
                  child: Text(
                    'Subscribe',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white
                    ),
                  )
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}