// import 'package:flutter/material.dart';

// bool showReportAlarm(BuildContext context) {
// // report question alarm
//   showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       backgroundColor: Colors.transparent,
//       content: Container(
//         decoration: BoxDecoration(
//             color: Colors.white, borderRadius: BorderRadius.circular(20)),
//         width: MediaQuery.of(context).size.width - 50,
//         height: 150,
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 15,
//             ),
//             const Padding(
//               padding: EdgeInsets.all(10.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Are you sure about the crash ',
//                     style: TextStyle(fontWeight: FontWeight.w600),
//                   ),
//                   Text(
//                     'report question?',
//                     style: TextStyle(fontWeight: FontWeight.w600),
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     return false;
//                   },
//                   child: Container(
//                     width: 100,
//                     height: 40,
//                     decoration: const BoxDecoration(
//                         image: DecorationImage(
//                             image: AssetImage('lib/assets/images/nobtn.png'),
//                             fit: BoxFit.fill)),
//                     child: const Center(
//                       child: Text(
//                         'No',
//                         style: TextStyle(
//                             color: Colors.white, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     return true;
//                   },
//                   child: Container(
//                     width: 100,
//                     height: 40,
//                     decoration: const BoxDecoration(
//                         image: DecorationImage(
//                             image: AssetImage('lib/assets/images/yesbtn.png'),
//                             fit: BoxFit.fill)),
//                     child: const Center(
//                       child: Text(
//                         'Yes',
//                         style: TextStyle(
//                             color: Colors.white, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     ),
//   );
// }
