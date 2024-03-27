import 'package:bilgimizde/view/home/dashboard/home_screen.dart';
import 'package:flutter/material.dart';

exitAlarm(BuildContext context) {
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
          children: [
            const SizedBox(
              height: 15,
            ),
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
                    child: const Center(
                      child: Text(
                        'No',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    width: 100,
                    height: 40,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('lib/assets/images/nobtn.png'),
                            fit: BoxFit.fill)),
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const HomeScreen(),
                          transitionDuration: const Duration(milliseconds: 500),
                          transitionsBuilder: (_, a, __, c) => FadeTransition(
                            opacity: a,
                            child: c,
                          ),
                        ),
                        (route) => false);
                  },
                  child: Container(
                    child: const Center(
                      child: Text(
                        'Yes',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    width: 100,
                    height: 40,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('lib/assets/images/yesbtn.png'),
                            fit: BoxFit.fill)),
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
