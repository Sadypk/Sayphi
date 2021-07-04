import 'package:flutter/material.dart';
import 'package:sayphi/authentication/repository/authRepo.dart';
import 'package:sayphi/mainApp/components/screenLoader.dart';
import 'package:sayphi/mainApp/helpers/snack.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/user/repository/userRepo.dart';

class ExtraOptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenLoader(
      child: Scaffold(
        backgroundColor: AppColor.SCAFFOLD_BACKGROUND,
        appBar: AppBar(
          title: Text('Extra', style: TextStyle(color: AppColor.TEXT_COLOR, fontSize: 16, fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15,),
              InkWell(
                onTap: ()async{
                  final error = await UserRepo.updateProfile(status: 'paused');
                  if(!error){
                    await AuthRepo.logout();
                    Snack.top(title: 'Warning!', message: 'Your account has been paused, login again to activate the account');
                  }
                },
                child: Text('Pause account', style: TextStyle(fontSize: 16, color: AppColor.TEXT_COLOR),)),
              Divider(height: 30,),
              InkWell(
                onTap: () async{
                  final error = await UserRepo.updateProfile(status: 'deleted');
                  if(!error){
                    await AuthRepo.logout();
                    Snack.top(title: 'Sorry', message: 'This account was deleted please contact support');
                  }
                },
                child: Text('Delete account', style: TextStyle(fontSize: 16, color: AppColor.TEXT_COLOR),)),
              Divider(height: 30,),
              InkWell(
                onTap: AuthRepo.logout,
                child: Text('Logout', style: TextStyle(fontSize: 16, color: AppColor.TEXT_COLOR),)),
              Divider(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}
