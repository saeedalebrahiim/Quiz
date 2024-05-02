import 'package:flutter/material.dart';

wifiAlarm(BuildContext context) {
  // Wifi error alarm
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
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('lib/assets/images/alarmexit.png'),
                            fit: BoxFit.fill)),
                  ),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                height: 150,
                width: MediaQuery.of(context).size.width - 50,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/images/alarmwifi.png'))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'internet bağlantınızı kontrol edininternet',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                    )
                  ],
                )),
          ],
        ),
      ),
    ),
  );
}
