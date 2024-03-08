import 'package:flutter/material.dart';

// Not SignUp Dialog
alert(BuildContext context) {
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
          mainAxisAlignment: MainAxisAlignment.end,
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
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'lib/assets/images/alarmsticker.png'))),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'You have not createt',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13),
                            ),
                            Text(
                              'an account  !!',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'lib/assets/images/alarmback.png'),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            child: Center(
                                child: Text(
                              'Signup',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            )),
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'lib/assets/images/alarmsignupbtn.png'),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                height: 190,
                width: MediaQuery.of(context).size.width - 50),
          ],
        ),
      ),
    ),
  );

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
          mainAxisAlignment: MainAxisAlignment.end,
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
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/images/alarmwifi.png'))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Check your internet',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                height: 150,
                width: MediaQuery.of(context).size.width - 50),
          ],
        ),
      ),
    ),
  );

//  successfully coin alarm
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              'Successfully',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/assets/images/coin.png'))),
                ),
                Text(
                  '10',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  'Added in your wallet to use',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              child: Container(
                child: Center(
                  child: Text(
                    'Got it',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                ),
                width: 100,
                height: 30,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/assets/images/alarmsuccess.png'),
                        fit: BoxFit.fill)),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        width: MediaQuery.of(context).size.width - 50,
        height: 150,
      ),
    ),
  );

// report question alarm
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Are you sure about the crash ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'report question?',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Center(
                    child: Text(
                      'No',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/assets/images/nobtn.png'),
                          fit: BoxFit.fill)),
                ),
                Container(
                  child: Center(
                    child: Text(
                      'Yes',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/assets/images/yesbtn.png'),
                          fit: BoxFit.fill)),
                )
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        width: MediaQuery.of(context).size.width - 50,
        height: 150,
      ),
    ),
  );
}
