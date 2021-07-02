// import 'package:flutter/material.dart';
// import 'package:sayphi/mainApp/components/chat_head.dart';
// import 'package:sayphi/mainApp/components/mainButton.dart';
// import 'package:sayphi/mainApp/resources/appColor.dart';
//
// class ChallengeFriendsVersion1 extends StatefulWidget {
//   @override
//   _ChallengeFriendsVersion1State createState() => _ChallengeFriendsVersion1State();
// }
//
// class _ChallengeFriendsVersion1State extends State<ChallengeFriendsVersion1> {
//   List<Widget> imageList = [
//     ChatHead(true, 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'John Snow', 69),
//     ChatHead(false, 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'John Snow', 69),
//     ChatHead(true, 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'John Snow', 69),
//     ChatHead(true, 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'John Snow', 69),
//     ChatHead(false, 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'John Snow', 69),
//     ChatHead(false, 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'John Snow', 69),
//     ChatHead(false, 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'John Snow', 69),
//     ChatHead(false, 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'John Snow', 69),
//     ChatHead(true, 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'John Snow', 69),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.SCAFFOLD_BACKGROUND,
//       appBar: AppBar(
//         title: Text('Extra', style: TextStyle(color: AppColor.TEXT_COLOR, fontSize: 16, fontWeight: FontWeight.bold),),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20),
//         child: ListView(
//           children: [
//             Text('Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard.', style: TextStyle(fontSize: 16, color: AppColor.TEXT_COLOR),),
//             SizedBox(height: 20,),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Icon(Icons.check_circle, color: AppColor.PRIMARY,),
//                 SizedBox(width: 5,),
//                 Text('Contrary to popular belief, Lorem Ipsum is not simply random text.', style: TextStyle(fontSize: 14, color: AppColor.TEXT_COLOR),),
//               ],
//             ),
//             SizedBox(height: 20,),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Icon(Icons.check_circle, color: AppColor.PRIMARY,),
//                 SizedBox(width: 5,),
//                 Text('Contrary to popular belief, Lorem Ipsum is not simply random text.', style: TextStyle(fontSize: 14, color: AppColor.TEXT_COLOR),),
//               ],
//             ),
//             SizedBox(height: 30,),
//             Text('Select and challenge your matches', style: TextStyle(fontSize: 16, color: AppColor.PRIMARY),),
//             Expanded(
//               child: GridView.count(
//                 crossAxisCount: 3,
//                 padding: EdgeInsets.only(bottom: 60),
//                 childAspectRatio: 10.0 / 9.0,
//                 children: imageList,
//               ),
//             ),
//             MainButton(onPress: (){}, label: 'Challenge', textStyle: TextStyle(fontSize: 18, color: Colors.white),)
//           ],
//         ),
//       ),
//     );
//   }
// }
