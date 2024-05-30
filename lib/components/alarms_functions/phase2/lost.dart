import 'package:bilgimizde/view/home/dashboard/home_screen.dart';
import 'package:bilgimizde/view/myrating/all/all_screen.dart.dart';
import 'package:bilgimizde/view/myrating/today/today_screen.dart';
import 'package:flutter/material.dart';

lost(BuildContext context) {
// report question alarm
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        width: MediaQuery.of(context).size.width - 50,
        height: 350,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "End of The test",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Image(
                image: AssetImage("lib/assets/images/lost.png"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Oh!",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Eğer sistemin seçtiği kelime Türkçe dilinde yoksa, ekran görüntüsü alıp bizimle paylaştığınız takdirde GEM iadesi talep edebilirsiniz",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
