// // ignore_for_file: file_names

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:zena/model/channel_model.dart';
// import 'package:zena/model/news_model.dart';

// class ChannelCatagorieList extends StatefulWidget {
//   const ChannelCatagorieList({Key? key}) : super(key: key);
//   @override
//   State<ChannelCatagorieList> createState() => _ChannelCatagorieListState();
// }

// class _ChannelCatagorieListState extends State<ChannelCatagorieList> {
//   int selectedIndex = 0;
  
//   @override
//   Widget build(BuildContext context) {
//     return channalCatagoriList(context);
//   }

//   Widget channalCatagoriList(context) {
//     return ListView.builder(
//       scrollDirection: Axis.horizontal,
//       shrinkWrap: true,
//       itemCount: channelCatagoryList.length,
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           onTap: () {
//             setState(() {
//               selectedIndex = index;
//               catagory = channelCatagoryList[index]['catagories'];
//             });
//           },
//           child: Padding(
//             padding: const EdgeInsets.only(
//                 top: 8.0, left: 20.0, right: 20.0, bottom: 8.0),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Theme.of(context).accentColor,
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(20.0),
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Theme.of(context).accentColor,
//                     offset: const Offset(1, 1),
//                     spreadRadius: 2.0,
//                     blurRadius: 5.0,
//                   ),
//                 ],
//               ),
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//                 child: Text(
//                   channelCatagoryList[index]['title'],
//                   style: GoogleFonts.acme(
//                     fontSize: 25.0,
//                     color: selectedIndex == index
//                         ? HexColor("#2E92EE")
//                         : Theme.of(context).primaryColor,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
