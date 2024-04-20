import 'package:bilgimizde/view/home/dashboard/home_screen.dart';
import 'package:bilgimizde/view/myrating/all/all_screen.dart.dart';
import 'package:bilgimizde/view/myrating/today/today_screen.dart';
import 'package:flutter/material.dart';

win(BuildContext context) {
// report question alarm
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        width: MediaQuery.of(context).size.width - 50,
        height: 250,
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
                image: AssetImage("lib/assets/images/win.png"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "CONGRATS!",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.amber,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "I congratulate you on your success",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
