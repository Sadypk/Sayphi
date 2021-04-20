import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sayphi/authentication/model/faceBookUserDataModel.dart';
import 'package:sayphi/authentication/repository/socialAuth.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              onPressed: () async {
                FbUserDataModel? userData = await SocialAuth.facebookAuth();
                if(userData != null){

                }
              },
              child: Text(
                'Facebook Login'
              )
            ),


            ElevatedButton(
              onPressed: () async {
                GoogleSignInAccount? userData = await SocialAuth.googleAuth();
                if(userData != null){
                  print(userData.toString());
                }
              },
              child: Text(
                'Google Login'
              )
            ),
          ],
        ),
      )
    );
  }
}
