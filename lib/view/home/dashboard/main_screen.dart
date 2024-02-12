import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/global.dart';
import 'package:quiz/provider/drawer_state.dart';
import 'package:quiz/view/home/quiz/quiz_screen.dart';
import 'package:quiz/view/profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double xOffset = 0;
  double yOffset = 0;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
          child: AppBar(
            actions: [
              Padding(
                padding:
                    const EdgeInsets.only(right: 5, left: 5, bottom: 5, top: 6),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => ProfileScreen(),
                          transitionDuration: const Duration(milliseconds: 500),
                          transitionsBuilder: (_, a, __, c) => FadeTransition(
                                opacity: a,
                                child: c,
                              )),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 10, 21, 94),
                        borderRadius: BorderRadius.circular(30)),
                    child: const Center(
                        child: Image(
                      image: AssetImage('lib/assets/images/profile.png'),
                    )),
                  ),
                ),
              ),
            ],
            centerTitle: true,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'lib/assets/images/coin.png',
                  width: 25,
                  height: 25,
                ),
                const Text(
                  '3012',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 10, 21, 94),
                    borderRadius: BorderRadius.circular(30)),
                child: isDrawerOpen
                    ? GestureDetector(
                        child: const Image(
                          image: AssetImage('lib/assets/images/appbaricon.png'),
                        ),
                        onTap: () {
                          setState(() {
                            xOffset = 0;
                            yOffset = 0;
                            isDrawerOpen = false;
                            drawerVisible = false;
                          });
                          context.read<DrawerState>().changeVisibleTwo();
                        },
                      )
                    : GestureDetector(
                        child: Image.asset('lib/assets/images/appbaricon.png'),
                        onTap: () {
                          setState(() {
                            xOffset = 220;
                            yOffset = 0;
                            isDrawerOpen = true;
                            drawerVisible = true;
                          });
                          context.read<DrawerState>().changeVisible();
                        },
                      ),
              ),
            ),
          ),
        ),
        AnimatedContainer(
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(isDrawerOpen ? 0.85 : 1.00)
            ..rotateZ(isDrawerOpen ? -50 : 0),
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: isDrawerOpen
                ? BorderRadius.circular(40)
                : BorderRadius.circular(0),
          ),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 76,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 40,
                          ),
                          Text(
                            'iyi haberler',
                            style: TextStyle(color: Colors.grey.shade300),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Image(
                            image:
                                AssetImage('lib/assets/images/mainsticker.png'),
                            width: 20,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          width: 300,
                          height: 105,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'lib/assets/images/mainburger.png'),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image(
                              image:
                                  AssetImage('lib/assets/images/mainstar.png'),
                              width: 75,
                              height: 75,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Watch the video and get ',
                                  style: TextStyle(color: Colors.orange),
                                ),
                                Text('points',
                                    style: TextStyle(color: Colors.orange))
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Yarışma',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Image(
                                    image: AssetImage(
                                        'lib/assets/images/coin.png'),
                                    width: 20,
                                    height: 20,
                                  ),
                                  Text(
                                    '2',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                        pageBuilder: (_, __, ___) =>
                                            QuizScreen(),
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
                                  width: 150,
                                  child: Center(
                                      child: Text(
                                    'Başla',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  height: 30,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'lib/assets/images/mainbuttun.png'),
                                          fit: BoxFit.fill)),
                                ),
                              )
                            ],
                          ),
                          width: 300,
                          height: 115,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'lib/assets/images/questionbg.png'),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              image: AssetImage('lib/assets/images/mainbg.png'),
                              fit: BoxFit.fitWidth,
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// class NewPadding extends StatelessWidget {
//   final String image1;
//   final String text1;
//   final String image2;
//   final String text2;

//   const NewPadding({
//     Key key,
//     this.image1,
//     this.text1,
//     this.image2,
//     this.text2,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 35),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Container(
//             width: 150,
//             height: 150,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(15),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.1),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: Offset(0, 0),
//                 ),
//               ],
//             ),
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 8),
//                   child: Image(
//                     height: 100,
//                     width: 100,
//                     image: AssetImage(image1),
//                   ),
//                 ),
//                 Text(
//                   text1,
//                   style: TextStyle(
//                       color: Colors.black87,
//                       fontSize: 15,
//                       decoration: TextDecoration.none),
//                 )
//               ],
//             ),
//           ),
//           Container(
//             width: 150,
//             height: 150,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(15),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.1),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: Offset(0, 0),
//                 ),
//               ],
//             ),
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 8),
//                   child: Image(
//                     height: 100,
//                     width: 100,
//                     image: AssetImage(image2),
//                   ),
//                 ),
//                 Text(
//                   text2,
//                   style: TextStyle(
//                       color: Colors.black87,
//                       fontSize: 15,
//                       decoration: TextDecoration.none),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
