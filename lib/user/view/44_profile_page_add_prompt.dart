import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sayphi/mainApp/components/cTextFiel.dart';
import 'package:sayphi/mainApp/components/emptyList.dart';
import 'package:sayphi/mainApp/components/loader.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/user/view/45_profile_page_add_prompt_list.dart';
import 'package:sayphi/user/model/promptModel.dart';
import 'package:sayphi/user/repository/userRepo.dart';

class ProfilePageAddPrompt extends StatefulWidget {
  @override
  _ProfilePageAddPromptState createState() => _ProfilePageAddPromptState();
}

class _ProfilePageAddPromptState extends State<ProfilePageAddPrompt> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),


        //Add a prompt card
        Container(
          height: 190,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.my_library_add_rounded, color: AppColor.DARK_GREY, size: 30,),
              SizedBox(height: 10,),
              Text('Specify your profiles to get more dates', style: TextStyle(fontSize: 16),),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  Get.to(()=>ProfilePageAddPromptList());
                },
                child: Container(
                  height: 50,
                  width: 155,
                  decoration: BoxDecoration(
                      color: AppColor.PRIMARY,
                      borderRadius: BorderRadius.circular(6)
                  ),
                  child: Center(
                    child: Text('Add a prompt', style: TextStyle(color: Colors.white, fontSize: 18),),
                  ),
                ),
              )
            ],
          ),
        ),


        SizedBox(height: 25,),


        //prompt list I guess
        FutureBuilder(
          future: UserRepo.getAllPrompts(),
          builder: (_, AsyncSnapshot<List<UserPromptModel>> snapshot){
            if(snapshot.hasData && snapshot.data != null){
              final data = snapshot.data!;
              return data.length > 0 ? Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (_, index) => PromptListTile(prompt: data[index])
                ),
              ) : EmptyList();
            }else{
              return Loader();
            }
          }
        )
      ],
    );
  }
}

class PromptListTile extends StatelessWidget {
  final UserPromptModel prompt;
  PromptListTile({Key? key, required this.prompt}) : super(key: key);

  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColor.TEXT_LIGHT, width: 0.5),
          borderRadius: BorderRadius.circular(5)
        ),
        child: ExpansionTile(
          title: Text(prompt.prompt, style: TextStyle(color: AppColor.PRIMARY, fontSize: 16)),
          subtitle: Text(prompt.answer, style: TextStyle(fontSize: 16, color: AppColor.TEXT_LIGHT)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.edit, size: 15, color: Color(0xff666666),),
              SizedBox(width: 7,),
              GestureDetector(
                onTap: (){
                  UserRepo.deletePrompt(prompt.id);
                },
                child: Icon(Icons.delete, size: 20, color: AppColor.PRIMARY,)),
            ],
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CTextField(
                controller: _textController,
                hintText: 'Your Answer',
              ),
            ),

            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: AppColor.PRIMARY),
                onPressed: (){

                  if(_textController.text != ''){
                    FocusScope.of(context).unfocus();
                    UserRepo.updatePrompt(prompt.id, _textController.text);
                    _textController.clear();
                  }

                },
                child: Text('Save')
            )
          ],
        ),
      ),
    );
  }
}
