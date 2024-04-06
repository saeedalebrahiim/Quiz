import 'package:flutter/material.dart';

gotCoin(BuildContext context) {
//  successfully coin alarm
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        width: MediaQuery.of(context).size.width - 50,
        height: 150,
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Successfully',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/assets/images/coin.png'))),
                ),
                const Text(
                  '10',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(
                  width: 3,
                ),
                const Text(
                  'Added in your wallet to use',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              child: Container(
                width: 100,
                height: 30,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/assets/images/alarmsuccess.png'),
                        fit: BoxFit.fill)),
                child: const Center(
                  child: Text(
                    'Got it',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
