import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/components/cTextFiel.dart';
import 'package:sayphi/mainApp/components/loader.dart';
import 'package:sayphi/mainApp/model/promtModel.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/user/repository/getBasicData.dart';
import 'package:sayphi/user/repository/userRepo.dart';

class ProfilePageAddPromptList extends StatefulWidget {
  @override
  _ProfilePageAddPromptListState createState() => _ProfilePageAddPromptListState();
}

class _ProfilePageAddPromptListState extends State<ProfilePageAddPromptList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.SCAFFOLD_BG_PINK,
      appBar: AppBar(
        title: Text('Add a prompt',style: TextStyle(
          fontSize: 16,
          color: AppColor.TEXT_COLOR,
          fontFamily: CFontFamily.REGULAR
        ),),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
        child: FutureBuilder(
          future: BasicDataRepo.getAllPrompts(),
          builder: (_, AsyncSnapshot<List<PromptModel>> snapshot){
            if(snapshot.hasData && snapshot.data!= null){
              return ListView.builder(
                itemCount: snapshot.data!.length,
                shrinkWrap: true,
                itemBuilder: (_, index) {

                  final _textController = TextEditingController();

                  final prompt = snapshot.data![index];

                  return Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 12),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.TEXT_LIGHT, width: 0.5),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white
                      ),
                      child: ExpansionTile(
                        title: Text(prompt.prompt, style: TextStyle(fontSize: 16, color: AppColor.TEXT_COLOR),),
                        trailing: SizedBox(),
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
                                UserRepo.addPrompt(prompt.id, _textController.text);
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
              );
            }else{
              return Loader();
            }
          },
        )
      ),
    );
  }
}
