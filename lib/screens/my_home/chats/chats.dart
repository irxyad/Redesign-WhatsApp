// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:gradient_widgets/gradient_widgets.dart';

// import '../../../material/colors/mycolors.dart';

// class PressedChat extends StatefulWidget {
//   const PressedChat({Key? key, required this.names}) : super(key: key);
//   final List<int> names;
//   @override
//   State<PressedChat> createState() => _PressedChatState();
// }

// class ChatMessage extends StatelessWidget {
//   final String type;
//   const ChatMessage({Key? key, required this.type}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: Row(
//         mainAxisAlignment:
//             type == "sent" ? MainAxisAlignment.end : MainAxisAlignment.start,
//         children: <Widget>[
//           GradientCard(
//             gradient: const LinearGradient(
//               colors: [Color(0xff8E2DE2), Color(0xff4A00E0)],
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(7.0),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: <Widget>[
//                   const Text(
//                     'Message',
//                     style: TextStyle(fontSize: 14, color: Colors.white),
//                   ),
//                   Text(
//                     '17:00',
//                     style: TextStyle(fontSize: 10, color: Colors.grey.shade800),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class _PressedChatState extends State<PressedChat> {
//   List akun = [];
//   @override
//   void initState() {
//     jsonData();
//     super.initState();
//   }

// //Read json file
//   jsonData() async {
//     await rootBundle.loadString('assets/json/list_chats.json').then((value) {
//       final data = json.decode(value);
//       setState(() {
//         akun = data;
//       });
//     });
//   }

//   @override
//   Widget build(
//     BuildContext context,
//   ) {
//     int index = akun.indexWhere(
//       (item) => item == "name",
//     );
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 25.0),
//       child: Center(
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(18),
//           child: Container(
//             height: Get.height / 2,
//             decoration: const BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage('assets/images/bgChat.jpg'),
//                     fit: BoxFit.cover)),
//             child: Column(
//               children: [
//                 //Appbar Custom
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   color: MyColor.greenWhatsApp,
//                   child: Row(
//                     children: [
//                       const CircleAvatar(
//                         radius: 18,
//                         backgroundImage: AssetImage('assets/images/bgChat.jpg'),
//                       ),
//                       const SizedBox(
//                         width: 15.0,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 8.0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               akun.length.toString(),
//                               style: const TextStyle(
//                                   color: Colors.white, fontSize: 16),
//                             ),
//                             Text(
//                               index.toString(),
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 12),
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 //List chats
//                 Expanded(
//                     child: ListView(
//                   children: const <Widget>[
//                     ChatMessage(type: 'sent'),
//                     ChatMessage(type: 'received'),
//                   ],
//                 ))
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
