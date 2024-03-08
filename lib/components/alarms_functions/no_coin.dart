import 'package:bilgimizde/view/buycoin/buy_coin_screen.dart';
import 'package:flutter/material.dart';

noCoinAlert(BuildContext context) {
// do you want coin ? alarm
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      alignment: Alignment.center,
      backgroundColor: Colors.transparent,
      content: Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width - 50,
        height: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('lib/assets/images/alarmexit.png'),
                            fit: BoxFit.fill)),
                  ),
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                height: 180,
                width: MediaQuery.of(context).size.width - 50,
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/images/alarmcoins.png'),
                              fit: BoxFit.fill)),
                    ),
                    Text(
                      'You do not want to buy any',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'coins ?',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  const BuyCoinScreen(),
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              transitionsBuilder: (_, a, __, c) =>
                                  FadeTransition(
                                    opacity: a,
                                    child: c,
                                  )),
                        );
                      },
                      child: Container(
                        width: 100,
                        height: 35,
                        child: Center(
                          child: Text(
                            'Buy Coin',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.orange),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    ),
  );
}
