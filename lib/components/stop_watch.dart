// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:bilgimizde/provider/stop_watch.dart';

// class PuzzleStopWatch extends StatelessWidget {
//   const PuzzleStopWatch({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<StopWatchProvider>(
//       builder: (c, stopWatchProvider, _) {
//         Duration duration = Duration(seconds: stopWatchProvider.secondsElapsed);

//         return Text(
//           duration.inSeconds.toString(),
//         );
//       },
//     );
//   }
// }
