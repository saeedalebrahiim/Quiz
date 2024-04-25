import 'package:bilgimizde/view/home/dashboard/home_screen.dart';
import 'package:bilgimizde/view/myrating/all/all_screen.dart.dart';
import 'package:bilgimizde/view/myrating/today/today_screen.dart';
import 'package:flutter/material.dart';

cantWithdraw(BuildContext context) {
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
              child: Image(
                image: AssetImage("lib/assets/images/wallet.png"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Your wallet is empty, you cannot withdraw",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
