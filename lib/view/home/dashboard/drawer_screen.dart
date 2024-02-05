import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/global.dart';
import 'package:quiz/provider/drawer_state.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 0, 3, 66),
          image: DecorationImage(
              image: AssetImage('lib/assets/images/bg2.png'),
              fit: BoxFit.fill)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Consumer<DrawerState>(
              builder: (context, value, child) => Visibility(
                visible: drawerVisible,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 55,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image(
                              image: AssetImage('lib/assets/images/home.png'),
                              width: 22,
                              height: 22,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Home',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image(
                              image: AssetImage('lib/assets/images/person.png'),
                              width: 22,
                              height: 22,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Profile',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image(
                              image: AssetImage('lib/assets/images/sun.png'),
                              width: 22,
                              height: 22,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'My Rating',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image(
                              image:
                                  AssetImage('lib/assets/images/ranking.png'),
                              width: 22,
                              height: 22,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Results this month',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image(
                              image: AssetImage('lib/assets/images/folder.png'),
                              width: 22,
                              height: 22,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'One Month',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image(
                              image: AssetImage('lib/assets/images/coffee.png'),
                              width: 22,
                              height: 22,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Questions',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image(
                              image: AssetImage('lib/assets/images/book.png'),
                              width: 22,
                              height: 22,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Rules',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image(
                              image: AssetImage('lib/assets/images/alarm.png'),
                              width: 22,
                              height: 22,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Help',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
