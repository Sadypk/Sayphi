import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/components/mainButton.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({Key? key}) : super(key: key);

  @override
  _SetPasswordScreenState createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode1.addListener(() {
      setState(() {

      });
    });
    _focusNode2.addListener(() {
      setState(() {

      });
    });
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
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Almost done! Just set a password',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: CFontFamily.MEDIUM
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Set a password to access your account in the future',
                style: TextStyle(
                    fontFamily: CFontFamily.REGULAR
                ),
              ),

              /// basic info`s suggestions about image uploads
              SizedBox(height: 20),

              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColor.PRIMARY
                    )
                  )
                ),
                child: TextField(
                  focusNode: _focusNode1,
                  decoration: InputDecoration(
                    labelText: 'Enter password',
                    labelStyle: TextStyle(
                      color: _focusNode1.hasPrimaryFocus ? AppColor.PRIMARY : null
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide.none)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColor.PRIMARY
                      )
                    )
                  ),
                  child: TextField(
                    focusNode: _focusNode2,
                    decoration: InputDecoration(
                      labelText: 'Confirm password',
                      labelStyle: TextStyle(
                        color: _focusNode2.hasPrimaryFocus ? AppColor.PRIMARY : null
                      ),
                      border: OutlineInputBorder(borderSide: BorderSide.none)
                    ),
                  ),
                ),
              ),


              SizedBox(height: 32),
              MainButton(
                onPress: (){},
                label: 'Continue'
              )
            ]
          ),
        )
      )
    );
  }
}
