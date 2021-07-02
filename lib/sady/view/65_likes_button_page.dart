// import 'package:flutter/material.dart';
// import 'package:sayphi/mainApp/components/chat_head.dart';
// import 'package:sayphi/mainApp/resources/appColor.dart';
//
// class LikesButtonPage extends StatefulWidget {
//   @override
//   _LikesButtonPageState createState() => _LikesButtonPageState();
// }
//
// class _LikesButtonPageState extends State<LikesButtonPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.SCAFFOLD_BACKGROUND,
//       appBar: AppBar(
//         title: Text('Likes', style: TextStyle(color: AppColor.TEXT_COLOR, fontSize: 16, fontWeight: FontWeight.bold),),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: EdgeInsets.only(left: 20),
//         child: ListView(
//           children: [
//
//             //My likes
//             Text('My likes', style: TextStyle(fontSize: 16, color: AppColor.TEXT_COLOR, fontWeight: FontWeight.w600),),
//             SizedBox(height: 20,),
//             Container(
//               height: 86,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (BuildContext context, int index){
//                   return Container(
//                       margin: EdgeInsets.only(right: 20),
//                       child: ChatHead(index%2==0, 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'John Snow', 69, size: 60,));
//                 }
//               ),
//             ),
//
//
//             Divider(height: 40, thickness: 1,),
//
//
//
//             //Who liked me
//             Text('Who liked me', style: TextStyle(fontSize: 16, color: AppColor.TEXT_COLOR, fontWeight: FontWeight.w600),),
//             SizedBox(height: 20,),
//             Container(
//               height: 86,
//               child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (BuildContext context, int index){
//                     return Container(
//                         margin: EdgeInsets.only(right: 20),
//                         child: ChatHead(index%2==0, 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'John Snow', 69, size: 60,));
//                   }
//               ),
//             ),
//
//
//
//             Divider(height: 40, thickness: 1,),
//
//
//
//
//             //Who visited me
//             Text('Who visited me', style: TextStyle(fontSize: 16, color: AppColor.TEXT_COLOR, fontWeight: FontWeight.w600),),
//             SizedBox(height: 20,),
//             Container(
//               height: 86,
//               child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (BuildContext context, int index){
//                     return Container(
//                         margin: EdgeInsets.only(right: 20),
//                         child: ChatHead(index%2==0, 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'John Snow', 69, size: 60,));
//                   }
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
