import 'package:bilgimizde/view/gem_quiz/gem_quiz_screen.dart';
import 'package:bilgimizde/view/home/dashboard/home_screen.dart';
import 'package:bilgimizde/view/myrating/all/all_screen.dart.dart';
import 'package:bilgimizde/view/myrating/today/today_screen.dart';
import 'package:flutter/material.dart';

exitAlarm2(BuildContext context) {
// report question alarm
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        width: MediaQuery.of(context).size.width - 50,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   width: 194,
            //   decoration: const BoxDecoration(
            //     boxShadow: [
            //       BoxShadow(
            //           color: Color.fromARGB(75, 2, 38, 3),
            //           blurRadius: 50,
            //           offset: Offset(0, 5),
            //           spreadRadius: 1)
            //     ],
            //   ),
            //   child: RawMaterialButton(
            //     onPressed: () {
            //       Navigator.of(context).pushAndRemoveUntil(
            //           PageRouteBuilder(
            //               pageBuilder: (_, __, ___) => const TodayScreen(),
            //               transitionDuration: const Duration(milliseconds: 500),
            //               transitionsBuilder: (_, a, __, c) => FadeTransition(
            //                     opacity: a,
            //                     child: c,
            //                   )),
            //           (route) => false);
            //     },
            //     fillColor: Colors.white,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(50),
            //     ),
            //     child: const Text(
            //       "Ödüllere git",
            //     ),
            //   ),
            // ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Are you sure you are about to exit ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Exit?',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('lib/assets/images/yesbtn.png'),
                            fit: BoxFit.fill)),
                    child: const Center(
                      child: Text(
                        'No',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const GemQuizScreen(),
                          transitionDuration: const Duration(milliseconds: 500),
                          transitionsBuilder: (_, a, __, c) => FadeTransition(
                            opacity: a,
                            child: c,
                          ),
                        ),
                        (route) => false);
                  },
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('lib/assets/images/nobtn.png'),
                            fit: BoxFit.fill)),
                    child: const Center(
                      child: Text(
                        'Yes',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}
